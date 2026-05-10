; DESCRIPTION: Renders a blue line between points (252, 69) and (300, 28).
; PLAN: r0=252(x1), r1=69(y1), r2=300(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 69
LDI r2, 300
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
