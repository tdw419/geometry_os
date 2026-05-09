; DESCRIPTION: Places a magenta line segment connecting (90, 4) to (101, 243).
; PLAN: r0=90(x1), r1=4(y1), r2=101(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 4
LDI r2, 101
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
