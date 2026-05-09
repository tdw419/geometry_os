; DESCRIPTION: Draws a red line from (412, 39) to (1, 92).
; PLAN: r0=412(x1), r1=39(y1), r2=1(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 39
LDI r2, 1
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
