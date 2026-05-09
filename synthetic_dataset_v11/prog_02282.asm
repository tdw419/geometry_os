; DESCRIPTION: Renders a orange line between points (92, 94) and (160, 134).
; PLAN: r0=92(x1), r1=94(y1), r2=160(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 94
LDI r2, 160
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
