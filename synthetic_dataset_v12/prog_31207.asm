; DESCRIPTION: Draws a orange line from (507, 202) to (46, 51).
; PLAN: r0=507(x1), r1=202(y1), r2=46(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 202
LDI r2, 46
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
