; DESCRIPTION: Renders a blue line between points (231, 248) and (217, 163).
; PLAN: r0=231(x1), r1=248(y1), r2=217(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 248
LDI r2, 217
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
