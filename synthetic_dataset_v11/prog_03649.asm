; DESCRIPTION: Draws a red line from (189, 138) to (78, 68).
; PLAN: r0=189(x1), r1=138(y1), r2=78(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 138
LDI r2, 78
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
