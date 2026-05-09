; DESCRIPTION: Renders a orange line between points (275, 247) and (492, 17).
; PLAN: r0=275(x1), r1=247(y1), r2=492(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 247
LDI r2, 492
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
