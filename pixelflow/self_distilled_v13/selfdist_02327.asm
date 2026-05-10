; DESCRIPTION: Renders a magenta line segment connecting (178, 32) to (325, 9).
; PLAN: r0=178(x1), r1=32(y1), r2=325(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 32
LDI r2, 325
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
