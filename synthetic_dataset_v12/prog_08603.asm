; DESCRIPTION: Renders a orange line between points (123, 120) and (130, 210).
; PLAN: r0=123(x1), r1=120(y1), r2=130(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 120
LDI r2, 130
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
