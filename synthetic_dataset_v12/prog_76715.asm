; DESCRIPTION: Draws a purple line from (507, 243) to (406, 8).
; PLAN: r0=507(x1), r1=243(y1), r2=406(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 243
LDI r2, 406
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
