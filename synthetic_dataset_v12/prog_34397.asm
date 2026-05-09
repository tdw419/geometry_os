; DESCRIPTION: Renders a purple line between points (252, 244) and (408, 24).
; PLAN: r0=252(x1), r1=244(y1), r2=408(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 244
LDI r2, 408
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
