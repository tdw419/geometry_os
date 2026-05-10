; DESCRIPTION: Draws a red line from (394, 41) to (8, 48).
; PLAN: r0=394(x1), r1=41(y1), r2=8(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 41
LDI r2, 8
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
