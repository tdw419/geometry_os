; DESCRIPTION: Draws a red line from (152, 227) to (15, 202).
; PLAN: r0=152(x1), r1=227(y1), r2=15(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 227
LDI r2, 15
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
