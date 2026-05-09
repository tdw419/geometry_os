; DESCRIPTION: Draws a yellow line from (114, 94) to (188, 187).
; PLAN: r0=114(x1), r1=94(y1), r2=188(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 94
LDI r2, 188
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
