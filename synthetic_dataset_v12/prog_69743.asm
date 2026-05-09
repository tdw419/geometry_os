; DESCRIPTION: Places a black line segment connecting (428, 160) to (396, 174).
; PLAN: r0=428(x1), r1=160(y1), r2=396(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 160
LDI r2, 396
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
