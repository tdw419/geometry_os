; DESCRIPTION: Renders a yellow line between points (234, 243) and (117, 206).
; PLAN: r0=234(x1), r1=243(y1), r2=117(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 243
LDI r2, 117
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
