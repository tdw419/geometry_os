; DESCRIPTION: Places a black line segment connecting (178, 234) to (100, 226).
; PLAN: r0=178(x1), r1=234(y1), r2=100(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 234
LDI r2, 100
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
