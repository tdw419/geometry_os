; DESCRIPTION: Places a black line segment connecting (509, 46) to (9, 52).
; PLAN: r0=509(x1), r1=46(y1), r2=9(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 46
LDI r2, 9
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
