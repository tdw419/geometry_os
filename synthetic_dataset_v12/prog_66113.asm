; DESCRIPTION: Draws a yellow line from (34, 59) to (158, 243).
; PLAN: r0=34(x1), r1=59(y1), r2=158(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 59
LDI r2, 158
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
