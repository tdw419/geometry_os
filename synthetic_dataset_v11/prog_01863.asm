; DESCRIPTION: Draws a green line from (32, 41) to (225, 95).
; PLAN: r0=32(x1), r1=41(y1), r2=225(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 41
LDI r2, 225
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
