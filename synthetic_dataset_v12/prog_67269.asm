; DESCRIPTION: Renders a orange line between points (198, 149) and (125, 28).
; PLAN: r0=198(x1), r1=149(y1), r2=125(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 149
LDI r2, 125
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
