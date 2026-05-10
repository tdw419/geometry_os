; DESCRIPTION: Renders a magenta line segment connecting (226, 69) to (381, 42).
; PLAN: r0=226(x1), r1=69(y1), r2=381(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 69
LDI r2, 381
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
