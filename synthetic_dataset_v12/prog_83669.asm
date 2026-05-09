; DESCRIPTION: Draws a yellow line from (161, 103) to (408, 114).
; PLAN: r0=161(x1), r1=103(y1), r2=408(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 103
LDI r2, 408
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
