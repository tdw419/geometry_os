; DESCRIPTION: Renders a magenta line segment connecting (379, 177) to (128, 22).
; PLAN: r0=379(x1), r1=177(y1), r2=128(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 177
LDI r2, 128
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
