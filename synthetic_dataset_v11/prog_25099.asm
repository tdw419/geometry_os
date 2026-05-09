; DESCRIPTION: Renders a orange line between points (249, 146) and (84, 40).
; PLAN: r0=249(x1), r1=146(y1), r2=84(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 146
LDI r2, 84
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
