; DESCRIPTION: Draws a cyan rectangle at (419, 17) with width 56 and height 52.
; PLAN: r0=419(x), r1=17(y), r2=56(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 17
LDI r2, 56
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
