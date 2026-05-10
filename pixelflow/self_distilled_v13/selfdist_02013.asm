; DESCRIPTION: Renders a magenta line segment connecting (372, 100) to (360, 132).
; PLAN: r0=372(x1), r1=100(y1), r2=360(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 100
LDI r2, 360
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
