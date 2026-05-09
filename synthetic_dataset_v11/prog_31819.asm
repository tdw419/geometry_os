; DESCRIPTION: Renders a magenta line between points (175, 255) and (155, 242).
; PLAN: r0=175(x1), r1=255(y1), r2=155(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 255
LDI r2, 155
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
