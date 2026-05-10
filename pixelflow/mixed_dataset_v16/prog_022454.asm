; DESCRIPTION: Renders a magenta line segment connecting (183, 60) to (263, 163).
; PLAN: r0=183(x1), r1=60(y1), r2=263(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 60
LDI r2, 263
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
