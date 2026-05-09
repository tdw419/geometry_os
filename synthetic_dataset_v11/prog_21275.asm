; DESCRIPTION: Places a black line segment connecting (205, 132) to (123, 183).
; PLAN: r0=205(x1), r1=132(y1), r2=123(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 132
LDI r2, 123
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
