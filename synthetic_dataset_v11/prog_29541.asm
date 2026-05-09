; DESCRIPTION: Renders a blue line between points (8, 28) and (156, 23).
; PLAN: r0=8(x1), r1=28(y1), r2=156(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 28
LDI r2, 156
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
