; DESCRIPTION: Renders a orange line segment connecting (267, 63) to (242, 130).
; PLAN: r0=267(x1), r1=63(y1), r2=242(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 63
LDI r2, 242
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
