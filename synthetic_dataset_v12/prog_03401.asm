; DESCRIPTION: Renders a orange line between points (40, 103) and (222, 46).
; PLAN: r0=40(x1), r1=103(y1), r2=222(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 103
LDI r2, 222
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
