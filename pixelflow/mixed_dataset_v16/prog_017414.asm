; DESCRIPTION: Renders a magenta line segment connecting (123, 144) to (283, 39).
; PLAN: r0=123(x1), r1=144(y1), r2=283(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 144
LDI r2, 283
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
