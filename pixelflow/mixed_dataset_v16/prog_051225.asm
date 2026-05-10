; DESCRIPTION: Places a black line segment connecting (227, 213) to (407, 68).
; PLAN: r0=227(x1), r1=213(y1), r2=407(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 213
LDI r2, 407
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
