; DESCRIPTION: Renders a orange line between points (166, 121) and (196, 163).
; PLAN: r0=166(x1), r1=121(y1), r2=196(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 121
LDI r2, 196
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
