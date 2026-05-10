; DESCRIPTION: Renders a green line between points (185, 231) and (124, 7).
; PLAN: r0=185(x1), r1=231(y1), r2=124(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 231
LDI r2, 124
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
