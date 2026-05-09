; DESCRIPTION: Places a black line segment connecting (329, 91) to (178, 133).
; PLAN: r0=329(x1), r1=91(y1), r2=178(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 91
LDI r2, 178
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
