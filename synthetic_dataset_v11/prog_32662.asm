; DESCRIPTION: Renders a purple line between points (197, 55) and (178, 244).
; PLAN: r0=197(x1), r1=55(y1), r2=178(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 55
LDI r2, 178
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
