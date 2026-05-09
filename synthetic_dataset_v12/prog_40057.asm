; DESCRIPTION: Renders a blue line between points (86, 143) and (337, 7).
; PLAN: r0=86(x1), r1=143(y1), r2=337(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 143
LDI r2, 337
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
