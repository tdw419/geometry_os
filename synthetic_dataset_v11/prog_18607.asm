; DESCRIPTION: Draws a red line from (198, 138) to (102, 49).
; PLAN: r0=198(x1), r1=138(y1), r2=102(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 138
LDI r2, 102
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
