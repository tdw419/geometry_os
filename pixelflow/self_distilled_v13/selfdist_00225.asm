; DESCRIPTION: Renders a magenta line segment connecting (242, 15) to (178, 112).
; PLAN: r0=242(x1), r1=15(y1), r2=178(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 15
LDI r2, 178
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
