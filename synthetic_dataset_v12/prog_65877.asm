; DESCRIPTION: Draws a yellow line from (9, 167) to (161, 103).
; PLAN: r0=9(x1), r1=167(y1), r2=161(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 167
LDI r2, 161
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
