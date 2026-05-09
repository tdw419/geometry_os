; DESCRIPTION: Renders a orange line between points (241, 252) and (206, 103).
; PLAN: r0=241(x1), r1=252(y1), r2=206(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 252
LDI r2, 206
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
