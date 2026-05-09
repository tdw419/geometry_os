; DESCRIPTION: Renders a orange line between points (66, 130) and (164, 184).
; PLAN: r0=66(x1), r1=130(y1), r2=164(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 130
LDI r2, 164
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
