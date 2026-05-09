; DESCRIPTION: Draws a yellow line from (53, 56) to (61, 74).
; PLAN: r0=53(x1), r1=56(y1), r2=61(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 56
LDI r2, 61
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
