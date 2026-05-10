; DESCRIPTION: Renders a orange line between points (481, 204) and (65, 29).
; PLAN: r0=481(x1), r1=204(y1), r2=65(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 204
LDI r2, 65
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
