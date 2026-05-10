; DESCRIPTION: Renders a orange line between points (313, 227) and (509, 197).
; PLAN: r0=313(x1), r1=227(y1), r2=509(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 227
LDI r2, 509
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
