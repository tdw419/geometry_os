; DESCRIPTION: Places a green line segment connecting (185, 244) to (234, 82).
; PLAN: r0=185(x1), r1=244(y1), r2=234(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 244
LDI r2, 234
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
