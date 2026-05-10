; DESCRIPTION: Renders a magenta line segment connecting (288, 164) to (175, 89).
; PLAN: r0=288(x1), r1=164(y1), r2=175(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 164
LDI r2, 175
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
