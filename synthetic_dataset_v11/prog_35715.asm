; DESCRIPTION: Draws a cyan rectangle at (127, 145) with width 112 and height 89.
; PLAN: r0=127(x), r1=145(y), r2=112(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 145
LDI r2, 112
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
