; DESCRIPTION: Places a magenta line segment connecting (5, 130) to (4, 115).
; PLAN: r0=5(x1), r1=130(y1), r2=4(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 130
LDI r2, 4
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
