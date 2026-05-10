; DESCRIPTION: Draws a yellow line from (223, 103) to (29, 41).
; PLAN: r0=223(x1), r1=103(y1), r2=29(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 103
LDI r2, 29
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
