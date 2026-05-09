; DESCRIPTION: Draws a cyan line from (41, 112) to (100, 88).
; PLAN: r0=41(x1), r1=112(y1), r2=100(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 112
LDI r2, 100
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
