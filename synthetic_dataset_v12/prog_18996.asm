; DESCRIPTION: Places a black line segment connecting (487, 91) to (278, 52).
; PLAN: r0=487(x1), r1=91(y1), r2=278(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 91
LDI r2, 278
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
