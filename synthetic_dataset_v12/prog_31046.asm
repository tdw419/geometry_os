; DESCRIPTION: Draws a blue rectangle at (97, 202) with width 102 and height 52.
; PLAN: r0=97(x), r1=202(y), r2=102(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 202
LDI r2, 102
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
