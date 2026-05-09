; DESCRIPTION: Renders a orange line between points (240, 50) and (222, 134).
; PLAN: r0=240(x1), r1=50(y1), r2=222(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 50
LDI r2, 222
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
