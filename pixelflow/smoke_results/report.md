# PixelGPT Smoke Test Report

Checkpoint: pixelflow/bilingual_llm_v13_ckpt.pt
Epoch: 1, Loss: 0.0585

## Summary
- Syntax: 10/10
- Visual: 10/10
- PLAN Consistency: 1/10

## 1. ; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
Status: ❌ (FAILED)
PLAN: ❌ Verified 1/4 register assignments. Mismatches: r0: PLAN says 363(x), code says 4301; r1: PLAN says 134(y), code says 121; r2: PLAN says 105(radius), code says 91

### Generated Assembly:
```
; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
; PLAN: r0=363(x), r1=134(y), r2=105(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 4301
LDI r1, 121
LDI r2, 91
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
LDI r0, 0x000FFF
FILL r0
HALT
```

## 3. ; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
Status: ❌ (FAILED)
PLAN: ❌ Verified 0/5 register assignments. Mismatches: r0: PLAN says 4151(x), code says 20; r1: PLAN says 104(y), code says 151; r2: PLAN says 101(x2), code says 42

### Generated Assembly:
```
; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
; PLAN: r0=4151(x), r1=104(y), r2=101(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 151
LDI r2, 42
LDI r3, 10140
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
```

## 4. ; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
Status: ❌ (FAILED)
PLAN: ❌ Verified 1/5 register assignments. Mismatches: r0: PLAN says 150(x1), code says 37; r1: PLAN says 16(y1), code says 131; r2: PLAN says 229(x2), code says 100

### Generated Assembly:
```
; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
; PLAN: r0=150(x1), r1=16(y1), r2=229(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 131
LDI r2, 100
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
```

## 5. ; DESCRIPTION: Clears the screen to black and then halts.
Status: ❌ (FAILED)
PLAN: ❌ Verified 0/2 register assignments. Mismatches: r0: PLAN says 0x1121(y), code says 000; r2: PLAN says 0x000000(color), code says 0x0000

### Generated Assembly:
```
; DESCRIPTION: Clears the screen to black and then halts.
; PLAN: r0=0x1121(y), r2=0x000000(color). Op: SUB r0, r1, r2.
LDI r0, 000
LDI r1, 159
LDI r2, 0x0000
FILL r0
HALT
```

## 6. ; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
Status: ❌ (FAILED)
PLAN: ❌ Verified 0/5 register assignments. Mismatches: r0: PLAN says 50(x), code says 425; r1: PLAN says 185(y), code says 50; r2: PLAN says 41(width), code says 105

### Generated Assembly:
```
; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
; PLAN: r0=50(x), r1=185(y), r2=41(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 50
LDI r2, 105
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
```

## 7. ; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
Status: ❌ (FAILED)
PLAN: ❌ Verified 0/5 register assignments. Mismatches: r0: PLAN says 311(x), code says 35; r1: PLAN says 19(y), code says 151; r2: PLAN says 12(width), code says 11

### Generated Assembly:
```
; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
; PLAN: r0=311(x), r1=19(y), r2=12(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 151
LDI r2, 11
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
```

## 8. ; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
Status: ❌ (FAILED)
PLAN: ❌ Verified 0/5 register assignments. Mismatches: r0: PLAN says 167(x), code says 131; r1: PLAN says 123(y), code says 15; r2: PLAN says 18(width), code says 166

### Generated Assembly:
```
; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
; PLAN: r0=167(x), r1=123(y), r2=18(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 15
LDI r2, 166
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
```

## 9. ; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
Status: ❌ (FAILED)
PLAN: ❌ Verified 0/3 register assignments. Mismatches: r0: PLAN says 90(x1), code says 78; r2: PLAN says 21(y2), code says 0xFF0000

### Generated Assembly:
```
; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
; PLAN: r0=90(x1), r2=21(y2), r4=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
```

## 10. ; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
Status: ❌ (FAILED)
PLAN: ❌ Verified 0/4 register assignments. Mismatches: r1: PLAN says 106(y), code says 181; r2: PLAN says 0(width), code says 20; r3: PLAN says 512(height), code says 0x000000

### Generated Assembly:
```
; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
; PLAN: r0=CMP flag (49(x), r1=106(y), r2=0(width), r3=512(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 181
LDI r2, 20
LDI r3, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
```

