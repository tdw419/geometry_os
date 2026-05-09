; DESCRIPTION: Draws a red line from (10, 18) to (102, 37).
; PLAN: r0=10(x1), r1=18(y1), r2=102(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 18
LDI r2, 102
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
