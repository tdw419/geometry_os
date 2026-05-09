; DESCRIPTION: Places a blue line segment connecting (253, 174) to (380, 142).
; PLAN: r0=253(x1), r1=174(y1), r2=380(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 174
LDI r2, 380
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
