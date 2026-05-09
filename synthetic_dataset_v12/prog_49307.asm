; DESCRIPTION: Renders a orange line between points (178, 151) and (275, 115).
; PLAN: r0=178(x1), r1=151(y1), r2=275(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 151
LDI r2, 275
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
