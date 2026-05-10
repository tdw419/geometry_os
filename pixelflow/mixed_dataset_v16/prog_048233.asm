; DESCRIPTION: Draws a yellow line from (149, 202) to (182, 131).
; PLAN: r0=149(x1), r1=202(y1), r2=182(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 202
LDI r2, 182
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
