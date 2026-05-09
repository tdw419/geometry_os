; DESCRIPTION: Draws a yellow line from (43, 59) to (461, 179).
; PLAN: r0=43(x1), r1=59(y1), r2=461(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 59
LDI r2, 461
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
