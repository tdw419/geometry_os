; DESCRIPTION: Renders a purple line between points (300, 194) and (206, 83).
; PLAN: r0=300(x1), r1=194(y1), r2=206(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 194
LDI r2, 206
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
