; DESCRIPTION: Draws a blue line from (86, 216) to (190, 242).
; PLAN: r0=86(x1), r1=216(y1), r2=190(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 216
LDI r2, 190
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
