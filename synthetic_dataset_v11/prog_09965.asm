; DESCRIPTION: Draws a green line from (41, 200) to (225, 223).
; PLAN: r0=41(x1), r1=200(y1), r2=225(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 200
LDI r2, 225
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
