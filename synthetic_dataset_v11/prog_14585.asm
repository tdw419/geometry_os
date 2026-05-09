; DESCRIPTION: Places a black line segment connecting (140, 46) to (52, 7).
; PLAN: r0=140(x1), r1=46(y1), r2=52(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 46
LDI r2, 52
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
