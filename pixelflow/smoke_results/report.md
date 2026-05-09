# PixelGPT V10 (Constrained) Smoke Test Report

Epoch: 17, Loss: 0.0201

## 1. ; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.

LDI r0, 128
LDI r1, 128
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
```

## 2. ; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).

LDI r0, 0xFF00FF
FILL r0
LDI r1, 0
HALT
```

## 3. ; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).

LDI r0, 64
LDI r1, 0
LDI r2, 0
LDI r3, 0
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
```

## 4. ; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).

LDI r0, 0
LDI r1, 0
LDI r2, 355
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
```

## 5. ; DESCRIPTION: Clears the screen to black and then halts.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Clears the screen to black and then halts.

LDI r0, 10
LDI r1, 10
LDI r2, 32
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
```

## 6. ; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.

LDI r0, 100
LDI r1, 100
LDI r2, 40
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
```

## 7. ; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.

LDI r1, 0
loop PSET r2, 1202FFFFFFFF, r1
```

## 8. ; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.

LDI r0, 8
LDI r1, 89
LDI r2, 25
LDI r3, 1
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
```

## 9. ; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Draws a horizontal red line across the middle of the screen.

LDI r0, 35
LDI r1, 1
LDI r2, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
```

## 10. ; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION: Fills the screen with a vertical gradient from black to white.

LDI r0, 0x00000
LINE r0, r1, r2, r3, r4
HALT
```

