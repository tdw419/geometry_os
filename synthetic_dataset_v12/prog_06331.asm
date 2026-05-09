; DESCRIPTION: Places a black line segment connecting (367, 174) to (438, 127).
; PLAN: r0=367(x1), r1=174(y1), r2=438(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 174
LDI r2, 438
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
