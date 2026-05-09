; DESCRIPTION: Renders a green line between points (234, 40) and (24, 161).
; PLAN: r0=234(x1), r1=40(y1), r2=24(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 40
LDI r2, 24
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
