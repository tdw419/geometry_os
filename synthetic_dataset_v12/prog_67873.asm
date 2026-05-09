; DESCRIPTION: Renders a purple line between points (464, 188) and (475, 121).
; PLAN: r0=464(x1), r1=188(y1), r2=475(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 188
LDI r2, 475
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
