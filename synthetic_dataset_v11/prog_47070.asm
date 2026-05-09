; DESCRIPTION: Renders a orange line between points (58, 121) and (123, 48).
; PLAN: r0=58(x1), r1=121(y1), r2=123(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 121
LDI r2, 123
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
