; DESCRIPTION: Renders a blue line between points (245, 104) and (217, 142).
; PLAN: r0=245(x1), r1=104(y1), r2=217(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 104
LDI r2, 217
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
