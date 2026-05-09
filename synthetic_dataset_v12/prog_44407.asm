; DESCRIPTION: Renders a blue line between points (399, 150) and (260, 173).
; PLAN: r0=399(x1), r1=150(y1), r2=260(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 150
LDI r2, 260
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
