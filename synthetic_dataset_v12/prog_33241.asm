; DESCRIPTION: Renders a blue line between points (251, 166) and (400, 196).
; PLAN: r0=251(x1), r1=166(y1), r2=400(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 166
LDI r2, 400
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
