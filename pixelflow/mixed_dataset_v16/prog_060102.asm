; DESCRIPTION: Draws a cyan line from (2, 100) to (369, 41).
; PLAN: r0=2(x1), r1=100(y1), r2=369(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 100
LDI r2, 369
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
