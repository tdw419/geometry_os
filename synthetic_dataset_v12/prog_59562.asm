; DESCRIPTION: Renders a magenta line between points (300, 7) and (46, 238).
; PLAN: r0=300(x1), r1=7(y1), r2=46(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 7
LDI r2, 46
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
