; DESCRIPTION: Draws a cyan rectangle at (324, 90) with width 56 and height 116.
; PLAN: r0=324(x), r1=90(y), r2=56(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 90
LDI r2, 56
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
