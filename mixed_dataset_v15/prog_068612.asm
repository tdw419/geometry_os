; DESCRIPTION: Draws a red line from (62, 41) to (386, 136).
; PLAN: r0=62(x1), r1=41(y1), r2=386(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 41
LDI r2, 386
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
