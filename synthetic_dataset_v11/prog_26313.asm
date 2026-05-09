; DESCRIPTION: Renders a magenta line between points (84, 242) and (160, 106).
; PLAN: r0=84(x1), r1=242(y1), r2=160(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 242
LDI r2, 160
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
