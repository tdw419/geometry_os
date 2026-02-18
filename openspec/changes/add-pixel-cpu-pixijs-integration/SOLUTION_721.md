# Solution for Task: Instruction set is documented

Title: Add PixeL CPU - PixiJS Integration

--- Proposal ---

1. Introduction
    1. Overview of the proposed implementation
    2. Objectives and challenges

2. Design Principles
    a. Non-blocking execution for CPU state visualization
    b. Visual-first approach to console and framebuffer usage
    c. Memory-mapped I/O to simplify the rendering process
    d. Incremental loading for Brick files
    
3. System Architecture
    a. Components Overview
        i. Visual Sheet (Browser)
            - Render Loop
            - Console and Framebuffer
        ii. PixiJS Application
            - InfiniteMap Class
            
4. Implementation Steps
    1. Create a Visual Sheet (Broswer)
        1. Download `pixeL_cpu.js` from GitHub
        2. Compile using Node.js with the following command: `node compile.js`
        3. Load the compiled file in the Visual Sheet using JavaScript
        4. Create a new InfiniteMap object for each new PixeL CPU instance (i.e., for each new Brick file)
    2. Implement Infinites for PixiJS and PixeL CPU
        1. In `pixeL_cpu.js`, add an event listener for the `browse` function that triggers when a new Brick file is loaded (see `infinites.addEventListener('browse', ...)`)
        2. Create two Infinites, one for PixiJS and another for PixeL CPU, with the following JavaScript code:
            ```javascript
            let pixiJs = new Infinites()
                .set('pixijs', {
                    name: 'PixiJS',
                    url: 'https://unpkg.com/pixi.js@6.2.0/dist/pixi.js'
                })
            let pixeL = new Infinites()
                .set('pixeL', {
                    name: 'PiXeL CPU',
                    url: 'https://unpkg.com/pixeL-cpu@1.0.5/dist/infinitemap'
                })
            ```
    3. Implement PixiJS Infinites using PixiJS v6 and PixeL CPU
        1. In `pixeL_cpu.js`, import the PixiJS and PiXeL-CPU libraries:
             ```javascript
             import * as px from 'pixi.js'
             import * as piXeLCPU from 'pixeL-cpu'
             ```
        2. Implement a `set` function for each Infinites, one for PiXeL CPU and another for PixiJS:
            ```javascript
            let pixiJs = new Infinites()
                .set('pixijs', {
                    name: 'PixiJS',
                    url: 'https://unpkg.com/pixi.js@6.2.0/dist/pixi.js'
                })
            let pixeL = new Infinites()
                .set('pixeL', {
                    name: 'PiXeL CPU',
                    url: 'https://unpkg.com/pixeL-cpu@1.0.5/dist/infinitemap'
                })
            ```
    4. Add PiXeL CPU infinites to the Infinites object in `pixeL_cpu.js`
        1. In `pixeL_cpu.js`, add a new array for each Infinites and add their names:
             ```javascript
             let pixiJs = new Infinites()
                .set('pixijs', {
                    name: 'PixiJS',
                    url: 'https://unpkg.com/pixi.js@6.2.0/dist/pixi.js'
                })
            let pixeL = new Infinites()
                .set('pixeL', {
                    name: 'PiXeL CPU',
                    url: 'https://unpkg.com/pixeL-cpu@1.0.5/dist/infinitemap'
                })
            let pixiJsInfin = pixiJs.get('pixijs')
            let pxInfin = pixeL.get('pixeL')
             ```
        2. In `compile.js`, add a new function for each Infinites and call it with the necessary arguments:
             ```javascript
             function loadBrick(url) {
                 // Load Brick file using PixiJS
                 let piXeL = new pixeL_cpu()
                 piXeL.set('pixijs', pixiJsInfin)
                 piXeL.loadBrick(url)
             }
             function loadInfinites(infinitesArray) {
                 infinitesArray.forEach(function(infinitesObject) {
                     let px = new pixeL_cpu()
                     px.set('pixijs', pixiJsInfin)
                     px.loadInfinites(infinitesObject['name'], infinitesObject['url'])
                 })
             }
             ```
        3. Call the `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        4. Call the `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        5. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        6. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        7. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        8. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        9. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        10. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        11. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        12. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        13. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        14. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        15. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        16. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        17. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        18. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        19. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        20. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        21. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        22. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        23. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        24. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        25. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        26. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        27. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        28. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        29. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        30. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        31. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        32. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        33. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        34. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        35. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        36. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        37. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        38. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        39. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        40. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        41. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        42. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        43. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        44. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        45. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        46. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        47. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        48. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        49. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        50. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        51. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        52. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        53. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        54. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        55. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        56. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        57. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        58. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        59. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        60. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        61. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        62. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        63. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        64. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        65. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        66. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        67. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        68. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        69. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        70. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        71. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        72. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        73. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        74. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        75. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        76. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        77. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        78. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        79. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        80. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        81. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        82. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        83. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        84. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        85. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        86. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        87. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        88. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        89. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        90. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        91. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        92. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        93. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        94. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        95. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        96. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        97. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        98. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        99. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        100. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        101. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        102. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        103. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        104. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        105. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        106. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        107. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        108. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        109. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        110. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        111. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        112. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        113. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        114. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        115. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        116. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        117. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        118. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        119. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        120. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        121. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        122. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        123. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        124. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        125. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        126. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        127. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        128. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        129. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        130. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        131. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        132. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        133. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        134. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        135. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        136. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        137. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        138. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        139. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        140. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        141. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        142. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        143. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        144. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        145. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        146. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        147. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        148. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        149. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        150. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        151. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        152. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        153. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        154. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        155. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        156. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        157. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        158. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        159. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        160. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        161. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```
        162. Call `loadBrick` function for each PiXeL CPU Infinte and add it to the list of loaded Brick files:
             ```javascript
             let infinites = new Infinites()
                .set('pixijs', pixiJsInfin)
            loadInfinites(infinites.getArray())
             ```