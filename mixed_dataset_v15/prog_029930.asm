; DESCRIPTION: Renders a magenta line segment connecting (333, 178) to (79, 98).
; PLAN: r0=333(x1), r1=178(y1), r2=79(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 178
LDI r2, 79
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
