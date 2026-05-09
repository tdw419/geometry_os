; DESCRIPTION: Draws a red line from (86, 123) to (152, 36).
; PLAN: r0=86(x1), r1=123(y1), r2=152(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 123
LDI r2, 152
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
