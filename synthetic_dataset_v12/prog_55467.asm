; DESCRIPTION: Renders a green line between points (432, 244) and (234, 137).
; PLAN: r0=432(x1), r1=244(y1), r2=234(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 244
LDI r2, 234
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
