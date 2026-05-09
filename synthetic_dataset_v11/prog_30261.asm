; DESCRIPTION: Renders a green line between points (234, 66) and (195, 59).
; PLAN: r0=234(x1), r1=66(y1), r2=195(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 66
LDI r2, 195
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
