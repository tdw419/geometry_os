; DESCRIPTION: Places a red line segment connecting (13, 41) to (161, 154).
; PLAN: r0=13(x1), r1=41(y1), r2=161(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 41
LDI r2, 161
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
