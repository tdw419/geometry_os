; DESCRIPTION: Draws a cyan line from (461, 10) to (41, 96).
; PLAN: r0=461(x1), r1=10(y1), r2=41(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 10
LDI r2, 41
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
