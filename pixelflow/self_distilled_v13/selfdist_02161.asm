; DESCRIPTION: Renders a magenta line segment connecting (242, 71) to (243, 35).
; PLAN: r0=242(x1), r1=71(y1), r2=243(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 71
LDI r2, 243
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
