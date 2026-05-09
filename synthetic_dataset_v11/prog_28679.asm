; DESCRIPTION: Renders a yellow line between points (201, 164) and (59, 86).
; PLAN: r0=201(x1), r1=164(y1), r2=59(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 164
LDI r2, 59
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
