; DESCRIPTION: Renders a orange line between points (289, 209) and (168, 22).
; PLAN: r0=289(x1), r1=209(y1), r2=168(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 209
LDI r2, 168
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
