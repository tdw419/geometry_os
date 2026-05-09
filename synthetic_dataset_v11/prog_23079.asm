; DESCRIPTION: Renders a yellow line between points (193, 244) and (2, 67).
; PLAN: r0=193(x1), r1=244(y1), r2=2(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 244
LDI r2, 2
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
