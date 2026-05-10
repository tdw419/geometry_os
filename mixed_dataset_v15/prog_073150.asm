; DESCRIPTION: Renders a blue line between points (253, 100) and (380, 236).
; PLAN: r0=253(x1), r1=100(y1), r2=380(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 100
LDI r2, 380
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
