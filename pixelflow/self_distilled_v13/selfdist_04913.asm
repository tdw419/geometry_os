; DESCRIPTION: Renders a green rectangular region spanning 22 by 26 at (291, 132).
; PLAN: r0=291(x), r1=132(y), r2=22(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 132
LDI r2, 22
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
