; DESCRIPTION: Draws a yellow line from (395, 36) to (297, 243).
; PLAN: r0=395(x1), r1=36(y1), r2=297(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 36
LDI r2, 297
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
