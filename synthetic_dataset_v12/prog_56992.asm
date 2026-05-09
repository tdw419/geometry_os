; DESCRIPTION: Draws a red line from (425, 1) to (103, 78).
; PLAN: r0=425(x1), r1=1(y1), r2=103(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 1
LDI r2, 103
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
