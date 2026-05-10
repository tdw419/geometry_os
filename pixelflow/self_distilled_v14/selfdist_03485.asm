; DESCRIPTION: Renders a magenta line segment connecting (30, 163) to (293, 192).
; PLAN: r0=30(x1), r1=163(y1), r2=293(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 163
LDI r2, 293
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
