; DESCRIPTION: Draws a cyan rectangle at (112, 185) with width 102 and height 52.
; PLAN: r0=112(x), r1=185(y), r2=102(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 185
LDI r2, 102
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
