; DESCRIPTION: Places a black line segment connecting (82, 55) to (9, 200).
; PLAN: r0=82(x1), r1=55(y1), r2=9(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 55
LDI r2, 9
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
