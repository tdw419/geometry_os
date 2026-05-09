; DESCRIPTION: Places a black line segment connecting (402, 234) to (178, 241).
; PLAN: r0=402(x1), r1=234(y1), r2=178(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 234
LDI r2, 178
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
