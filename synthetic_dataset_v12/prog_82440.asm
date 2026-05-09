; DESCRIPTION: Places a black line segment connecting (234, 125) to (350, 161).
; PLAN: r0=234(x1), r1=125(y1), r2=350(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 125
LDI r2, 350
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
