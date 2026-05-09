; DESCRIPTION: Places a green line segment connecting (41, 55) to (95, 51).
; PLAN: r0=41(x1), r1=55(y1), r2=95(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 55
LDI r2, 95
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
