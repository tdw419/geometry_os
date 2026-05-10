; DESCRIPTION: Renders a magenta line segment connecting (228, 125) to (153, 100).
; PLAN: r0=228(x1), r1=125(y1), r2=153(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 125
LDI r2, 153
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
