; DESCRIPTION: Renders a blue line between points (199, 0) and (96, 207).
; PLAN: r0=199(x1), r1=0(y1), r2=96(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 0
LDI r2, 96
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
