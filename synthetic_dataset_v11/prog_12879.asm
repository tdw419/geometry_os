; DESCRIPTION: Draws a yellow line from (174, 240) to (58, 158).
; PLAN: r0=174(x1), r1=240(y1), r2=58(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 240
LDI r2, 58
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
