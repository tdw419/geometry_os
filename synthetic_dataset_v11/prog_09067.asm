; DESCRIPTION: Draws a red line from (168, 92) to (56, 61).
; PLAN: r0=168(x1), r1=92(y1), r2=56(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 92
LDI r2, 56
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
