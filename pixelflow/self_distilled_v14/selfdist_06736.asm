; DESCRIPTION: Renders a blue line segment connecting (30, 92) to (360, 125).
; PLAN: r0=30(x1), r1=92(y1), r2=360(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 92
LDI r2, 360
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
