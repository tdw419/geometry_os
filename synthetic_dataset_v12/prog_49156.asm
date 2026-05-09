; DESCRIPTION: Draws a yellow line from (292, 131) to (501, 6).
; PLAN: r0=292(x1), r1=131(y1), r2=501(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 131
LDI r2, 501
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
