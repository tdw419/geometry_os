; DESCRIPTION: Renders a yellow line between points (95, 136) and (371, 210).
; PLAN: r0=95(x1), r1=136(y1), r2=371(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 136
LDI r2, 371
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
