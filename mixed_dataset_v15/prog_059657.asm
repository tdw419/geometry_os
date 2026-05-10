; DESCRIPTION: Draws a yellow line from (313, 175) to (118, 53).
; PLAN: r0=313(x1), r1=175(y1), r2=118(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 175
LDI r2, 118
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
