; DESCRIPTION: Draws a yellow line from (116, 47) to (135, 130).
; PLAN: r0=116(x1), r1=47(y1), r2=135(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 47
LDI r2, 135
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
