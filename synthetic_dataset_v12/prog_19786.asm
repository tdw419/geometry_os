; DESCRIPTION: Draws a green line from (99, 33) to (498, 41).
; PLAN: r0=99(x1), r1=33(y1), r2=498(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 33
LDI r2, 498
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
