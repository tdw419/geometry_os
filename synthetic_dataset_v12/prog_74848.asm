; DESCRIPTION: Renders a blue line between points (308, 157) and (88, 113).
; PLAN: r0=308(x1), r1=157(y1), r2=88(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 157
LDI r2, 88
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
