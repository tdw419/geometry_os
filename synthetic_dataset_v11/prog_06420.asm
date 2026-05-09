; DESCRIPTION: Draws a cyan rectangle at (185, 56) with width 36 and height 90.
; PLAN: r0=185(x), r1=56(y), r2=36(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 56
LDI r2, 36
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
