; DESCRIPTION: Draws a red line from (100, 245) to (430, 50).
; PLAN: r0=100(x1), r1=245(y1), r2=430(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 245
LDI r2, 430
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
