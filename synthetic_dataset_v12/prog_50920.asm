; DESCRIPTION: Renders a orange line between points (170, 33) and (113, 237).
; PLAN: r0=170(x1), r1=33(y1), r2=113(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 33
LDI r2, 113
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
