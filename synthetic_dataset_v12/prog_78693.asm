; DESCRIPTION: Draws a yellow line from (475, 92) to (252, 168).
; PLAN: r0=475(x1), r1=92(y1), r2=252(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 92
LDI r2, 252
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
