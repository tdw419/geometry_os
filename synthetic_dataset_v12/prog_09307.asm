; DESCRIPTION: Renders a yellow line between points (117, 244) and (223, 234).
; PLAN: r0=117(x1), r1=244(y1), r2=223(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 244
LDI r2, 223
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
