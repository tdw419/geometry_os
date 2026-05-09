; DESCRIPTION: Renders a orange line between points (152, 217) and (150, 28).
; PLAN: r0=152(x1), r1=217(y1), r2=150(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 217
LDI r2, 150
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
