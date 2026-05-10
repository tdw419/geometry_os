; DESCRIPTION: Renders a magenta line segment connecting (280, 177) to (16, 50).
; PLAN: r0=280(x1), r1=177(y1), r2=16(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 177
LDI r2, 16
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
