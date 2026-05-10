; DESCRIPTION: Renders a magenta line segment connecting (199, 24) to (327, 95).
; PLAN: r0=199(x1), r1=24(y1), r2=327(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 24
LDI r2, 327
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
