; DESCRIPTION: Draws a yellow line from (181, 148) to (220, 53).
; PLAN: r0=181(x1), r1=148(y1), r2=220(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 148
LDI r2, 220
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
