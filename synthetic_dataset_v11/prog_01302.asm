; DESCRIPTION: Draws a red line from (53, 92) to (71, 58).
; PLAN: r0=53(x1), r1=92(y1), r2=71(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 92
LDI r2, 71
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
