; DESCRIPTION: Draws a cyan line from (41, 181) to (15, 70).
; PLAN: r0=41(x1), r1=181(y1), r2=15(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 181
LDI r2, 15
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
