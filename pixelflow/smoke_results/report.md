# PixelGPT Smoke Test Report

Checkpoint: pixelflow/bilingual_llm_v13_ckpt.pt
Epoch: 20, Loss: 0.0248

## Summary
- Syntax: 9/10
- Visual: 9/10
- PLAN Consistency: 10/10

## 1. ; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
Status: ✅ (PASSED)
PLAN: ✅ Verified 4/4 register assignments

### Generated Assembly:
```
; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
; PLAN: r0=128(x), r1=128(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 128
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
```

## 2. ; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).
Status: ✅ (PASSED)
PLAN: ✅ No PLAN (V10 style, skip semantic check)

### Generated Assembly:
```
; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF). Op: FILL r0.
LDI r0, 0x0000FF
FILL r0
HALT
```

## 3. ; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
Status: ✅ (PASSED)
PLAN: ✅ Verified 5/5 register assignments

### Generated Assembly:
```
; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
; PLAN: r0=0(x), r1=0(y), r2=64(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 0
LDI r2, 64
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
```

## 4. ; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
Status: ✅ (PASSED)
PLAN: ✅ Verified 5/5 register assignments

### Generated Assembly:
```
; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
; PLAN: r0=0(x1), r1=0(y1), r2=255(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 0
LDI r2, 255
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
```

## 5. ; DESCRIPTION: Clears the screen to black and then halts.
Status: ✅ (PASSED)
PLAN: ✅ Verified 1/1 register assignments

### Generated Assembly:
```
; DESCRIPTION: Clears the screen to black and then halts.
; PLAN: r0=0x000000(color). Op: FILL r0.
LDI r0, 0x000000
FILL r0
HALT
```

## 6. ; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
Status: ✅ (PASSED)
PLAN: ✅ Verified 5/5 register assignments

### Generated Assembly:
```
; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
; PLAN: r0=100(x), r1=100(y), r2=40(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 100
LDI r2, 40
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
```

## 7. ; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
Status: ✅ (PASSED)
PLAN: ✅ Verified 3/3 register assignments

### Generated Assembly:
```
; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
; PLAN: r0=10(x), r1=10(y), r2=1(step). Loop: SUB r1, r2 then JNZ r1, r3.
LDI r0, 10
LDI r1, 10
LDI r2, 1
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
```

## 8. ; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
Status: ✅ (PASSED)
PLAN: ✅ Verified 4/4 register assignments

### Generated Assembly:
```
; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
; PLAN: r0=3(x), r1=8(y), r2=89(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 3
LDI r1, 8
LDI r2, 89
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
```

## 9. ; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
Status: ✅ (PASSED)
PLAN: ✅ Verified 1/1 register assignments

### Generated Assembly:
```
; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
; PLAN: r0=0xFF0000(color). Op: FILL r0.
LDI r0, 0xFF0000
FILL r0
HALT
```

## 10. ; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
Status: ❌ (FAILED)
PLAN: ✅ Verified 2/4 register assignments

### Generated Assembly:
```
; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(width), r4=0xFFFFFF(color). CMP stores result in r0.
LDI r7, 0xFFFFFF
LDI r1, 0
LDI r2, 0
LDI r5, 0
JNZ r1, loop
LDI r5, 0
```

