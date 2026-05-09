; DESCRIPTION: Renders a blue line between points (394, 121) and (351, 38).
; PLAN: r0=394(x1), r1=121(y1), r2=351(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 121
LDI r2, 351
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
