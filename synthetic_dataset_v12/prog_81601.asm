; DESCRIPTION: Renders a orange line between points (340, 78) and (95, 143).
; PLAN: r0=340(x1), r1=78(y1), r2=95(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 78
LDI r2, 95
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
