; DESCRIPTION: Renders a magenta line segment connecting (131, 144) to (183, 12).
; PLAN: r0=131(x1), r1=144(y1), r2=183(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 144
LDI r2, 183
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
