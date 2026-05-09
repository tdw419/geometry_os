; DESCRIPTION: Renders a yellow line between points (92, 222) and (159, 196).
; PLAN: r0=92(x1), r1=222(y1), r2=159(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 222
LDI r2, 159
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
