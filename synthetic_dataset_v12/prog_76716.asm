; DESCRIPTION: Draws a green line from (41, 162) to (46, 174).
; PLAN: r0=41(x1), r1=162(y1), r2=46(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 162
LDI r2, 46
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
