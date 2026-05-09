; DESCRIPTION: Places a black line segment connecting (9, 125) to (212, 178).
; PLAN: r0=9(x1), r1=125(y1), r2=212(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 125
LDI r2, 212
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
