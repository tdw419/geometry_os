; DESCRIPTION: Renders a orange line between points (434, 0) and (175, 70).
; PLAN: r0=434(x1), r1=0(y1), r2=175(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 0
LDI r2, 175
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
