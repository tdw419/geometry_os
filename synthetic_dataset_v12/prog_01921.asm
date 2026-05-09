; DESCRIPTION: Draws a green line from (486, 41) to (114, 72).
; PLAN: r0=486(x1), r1=41(y1), r2=114(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 41
LDI r2, 114
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
