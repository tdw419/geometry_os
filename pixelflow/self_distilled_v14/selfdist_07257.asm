; DESCRIPTION: Renders a magenta line segment connecting (323, 13) to (213, 98).
; PLAN: r0=323(x1), r1=13(y1), r2=213(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 13
LDI r2, 213
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
