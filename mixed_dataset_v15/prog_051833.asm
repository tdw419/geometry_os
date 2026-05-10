; DESCRIPTION: Renders a orange line between points (62, 141) and (152, 146).
; PLAN: r0=62(x1), r1=141(y1), r2=152(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 141
LDI r2, 152
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
