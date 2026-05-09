; DESCRIPTION: Draws a yellow line from (116, 139) to (243, 136).
; PLAN: r0=116(x1), r1=139(y1), r2=243(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 139
LDI r2, 243
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
