; DESCRIPTION: Renders a blue line between points (464, 141) and (353, 188).
; PLAN: r0=464(x1), r1=141(y1), r2=353(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 141
LDI r2, 353
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
