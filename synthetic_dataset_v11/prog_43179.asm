; DESCRIPTION: Renders a blue line between points (173, 33) and (159, 109).
; PLAN: r0=173(x1), r1=33(y1), r2=159(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 33
LDI r2, 159
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
