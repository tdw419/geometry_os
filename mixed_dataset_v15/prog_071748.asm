; DESCRIPTION: Places a black line segment connecting (71, 20) to (316, 46).
; PLAN: r0=71(x1), r1=20(y1), r2=316(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 20
LDI r2, 316
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
