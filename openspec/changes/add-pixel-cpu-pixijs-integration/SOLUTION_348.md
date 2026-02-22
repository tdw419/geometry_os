# Solution for Task: Framebuffer and console are created

Propósito: Add PixeL CPU - PixiJS Integration (Phase 40)

Enfoque: El objetivo es integrar el procesador de PixeL con la visualización del mapa infinito, PiXiJS. Además, se busca mantener una framerate de 60 fps durante la ejecución de los brick files.

Problema: La actualización del procesador de PixeL impide la ejecución de los brick files y el rendimiento es limitado. Se desea crear un sistema que permita la ejecución de la CPU y el mapa infinito en una sola instancia. No hay integración entre el procesador de PixeL y el mapa infinito, impidiendo la visualización del estado del cpu durante la ejecución de los brick files.

Solución:

1) Principios:
- Non-blocking execution (CPU está visible en el mapa)
- Visualización del estado del cpu en el mapa
- Incremental loading (Brick files son lentos y se cargan con el tiempo)
- Performance primero (Mantener 60 fps durante la ejecución de los brick files)

2) System Architecture:

Compensación:
- Compatibilidad con PixeL CPU Emulator (pixeL_cpu.js)
- Compatibilidad con PiXiJS InfiniteMap (infinitemap.js)

Ingeniería de código:
- PiXiJS InfiniteMap (infinitemap.js) debe ser utilizado en lugar de PixeL CPU Emulator (pixeL_cpu.js).
- PiXiJS InfiniteMap debe permitir la ejecución de las instrucciones RISC-V y devolverse un valor en tiempo real al mapa infinito.

3) Desarrollo:

1) Creación de una nueva clase de infinitemap que permite la ejecución de los brick files, además de su visualización.
```
class Infinitemap {
  constructor(options) {
    this.options = options;
  }
  
  async start() {
    // Inicializacion del mapa infinito
    const renderLoop = () => {
      for (let y = 0; y < this.height; y++) {
        for (let x = 0; x < this.width; x++) {
          const pixel = this.pixels[x + y * this.width];
          const r = pixel[0];
          const g = pixel[1];
          const b = pixel[2];
          
          // Pasar el valor al mapa infinito
          await this.map.putPixel(x, y, { r: r, g: g, b: b });
        }
      }
    };
    
    this.renderLoop = renderLoop;
  }
  
  async stop() {
    // Eliminación de la tarea de renderloop
    clearInterval(this.renderLoop);
  }
}
```

2) Creación del mapa infinito:
- Agregar una nueva propiedad al objeto Infinitemap ('map')
- Implementar un método 'putPixel' que permite agregar pixel a la tarea de render loop
```
class Infinitemap {
  constructor(options) {
    this.options = options;
    this.pixels = [];
    
    // Agregamos una nueva propiedad al objeto Infinitemap ('map')
    this.map = new Map();
    
    // Agregamos un método 'putPixel' que permite agregar pixel a la tarea de render loop
    this.putPixel = (x, y, data) => {
      const r = data.r;
      const g = data.g;
      const b = data.b;
      
      this.map.set(new Pixel(x, y), { r: r, g: g, b: b });
    };
  }
  
  start() {
    this.renderLoop = async () => {
      for (let y = 0; y < this.height; y++) {
        for (let x = 0; x < this.width; x++) {
          const pixel = this.pixels[x + y * this.width];
          
          // Pasar el valor al mapa infinito
          await this.map.putPixel(x, y, { r: pixel[0], g: pixel[1], b: pixel[2] });
        }
      }
    };
    
    this.renderLoop();
  }
  
  stop() {
    clearInterval(this.renderLoop);
  }
}
```

3) Combinación de PiXiJS InfiniteMap y PixeL CPU Emulator (pixeL_cpu.js):
- Agregar una nueva propiedad al objeto Infinitemap ('pixels')
- Implementar un método 'getPixel' que permite obtener el valor de pixel del mapa infinito
```
class Infinitemap {
  constructor(options) {
    this.options = options;
    this.pixels = [];
    
    // Agregamos una nueva propiedad al objeto Infinitemap ('map')
    this.map = new Map();
    
    // Agregamos un método 'putPixel' que permite agregar pixel a la tarea de render loop
    this.putPixel = (x, y, data) => {
      const r = data.r;
      const g = data.g;
      const b = data.b;
      
      this.pixels.push(new Pixel(x, y, { r: r, g: g, b: b }));
    };
  }
  
  start() {
    this.renderLoop = async () => {
      for (let y = 0; y < this.height; y++) {
        for (let x = 0; x < this.width; x++) {
          const pixel = await this.map.getPixel(x, y);
          
          // Pasar el valor de pixel del mapa infinito al objeto Infinitemap
          this.pixels[y][x] = new Pixel(pixel.x, pixel.y, { r: pixel.r, g: pixel.g, b: pixel.b });
        }
      }
    };
    
    this.renderLoop();
  }
  
  stop() {
    clearInterval(this.renderLoop);
  }
}
```

4) Combinación de PiXiJS InfiniteMap y pixeL CPU (infinitel_map.js):
- Agregamos un método 'putPixel' que permite agregar pixel a la tarea de render loop del infinitel_map
```
class Infinitemap {
  constructor(options) {
    this.options = options;
    
    // Agregamos una nueva propiedad al objeto Infinitemap ('pixels')
    this.pixels = [];
    
    // Agregamos un método 'putPixel' que permite agregar pixel a la tarea de render loop del infinitel_map
    this.putPixel = (x, y, data) => {
      const r = data.r;
      const g = data.g;
      const b = data.b;
      
      this.pixels[y][x] = new Pixel(x, y, { r: r, g: g, b: b });
    };
  }
  
  start() {
    this.renderLoop = async () => {
      for (let y = 0; y < this.height; y++) {
        for (let x = 0; x < this.width; x++) {
          const pixel = await this.map.getPixel(x, y);
          
          // Pasar el valor de pixel del mapa infinito al objeto Infinitemap
          this.pixels[y][x] = new Pixel(pixel.x, pixel.y, { r: pixel.r, g: pixel.g, b: pixel.b });
        }
      }
    };
    
    this.renderLoop();
  }
  
  stop() {
    clearInterval(this.renderLoop);
  }
}
```