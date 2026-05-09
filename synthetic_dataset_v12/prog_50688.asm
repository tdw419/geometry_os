; DESCRIPTION: Renders a blue line between points (411, 16) and (260, 60).
; PLAN: r0=411(x1), r1=16(y1), r2=260(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 16
LDI r2, 260
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
