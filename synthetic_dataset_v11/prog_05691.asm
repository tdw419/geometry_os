; DESCRIPTION: Renders a green line between points (234, 226) and (2, 234).
; PLAN: r0=234(x1), r1=226(y1), r2=2(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 226
LDI r2, 2
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
