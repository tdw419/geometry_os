; DESCRIPTION: Draws a red rectangle at (447, 64) with width 56 and height 26.
; PLAN: r0=447(x), r1=64(y), r2=56(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 64
LDI r2, 56
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
