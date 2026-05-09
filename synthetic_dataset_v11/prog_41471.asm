; DESCRIPTION: Draws a green line from (162, 138) to (40, 230).
; PLAN: r0=162(x1), r1=138(y1), r2=40(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 138
LDI r2, 40
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
