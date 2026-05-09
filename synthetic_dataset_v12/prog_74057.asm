; DESCRIPTION: Draws a yellow line from (181, 171) to (156, 153).
; PLAN: r0=181(x1), r1=171(y1), r2=156(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 171
LDI r2, 156
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
