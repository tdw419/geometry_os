; DESCRIPTION: Draws a orange line from (367, 58) to (507, 154).
; PLAN: r0=367(x1), r1=58(y1), r2=507(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 58
LDI r2, 507
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
