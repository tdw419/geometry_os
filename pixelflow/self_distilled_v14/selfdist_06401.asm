; DESCRIPTION: Renders a magenta line segment connecting (205, 185) to (228, 168).
; PLAN: r0=205(x1), r1=185(y1), r2=228(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 185
LDI r2, 228
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
