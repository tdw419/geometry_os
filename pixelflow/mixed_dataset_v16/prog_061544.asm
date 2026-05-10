; DESCRIPTION: Draws a yellow line from (306, 174) to (505, 179).
; PLAN: r0=306(x1), r1=174(y1), r2=505(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 174
LDI r2, 505
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
