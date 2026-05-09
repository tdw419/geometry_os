; DESCRIPTION: Renders a blue line between points (510, 242) and (437, 99).
; PLAN: r0=510(x1), r1=242(y1), r2=437(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 242
LDI r2, 437
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
