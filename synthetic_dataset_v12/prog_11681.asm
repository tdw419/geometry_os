; DESCRIPTION: Renders a white box of size 25x97 starting at (451, 102).
; PLAN: r0=451(x), r1=102(y), r2=25(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 102
LDI r2, 25
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
