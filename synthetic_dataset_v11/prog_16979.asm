; DESCRIPTION: Draws a orange line from (252, 18) to (121, 126).
; PLAN: r0=252(x1), r1=18(y1), r2=121(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 18
LDI r2, 121
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
