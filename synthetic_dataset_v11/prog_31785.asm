; DESCRIPTION: Renders a blue line between points (20, 176) and (10, 173).
; PLAN: r0=20(x1), r1=176(y1), r2=10(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 176
LDI r2, 10
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
