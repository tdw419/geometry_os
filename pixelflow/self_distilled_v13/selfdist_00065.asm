; DESCRIPTION: Renders a magenta line segment connecting (46, 25) to (100, 186).
; PLAN: r0=46(x1), r1=25(y1), r2=100(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 25
LDI r2, 100
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
