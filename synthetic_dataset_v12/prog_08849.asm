; DESCRIPTION: Renders a magenta line between points (301, 110) and (230, 134).
; PLAN: r0=301(x1), r1=110(y1), r2=230(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 110
LDI r2, 230
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
