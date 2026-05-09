; DESCRIPTION: Renders a orange line between points (143, 130) and (149, 210).
; PLAN: r0=143(x1), r1=130(y1), r2=149(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 130
LDI r2, 149
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
