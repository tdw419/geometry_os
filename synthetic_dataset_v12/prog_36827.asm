; DESCRIPTION: Draws a orange line from (435, 151) to (275, 156).
; PLAN: r0=435(x1), r1=151(y1), r2=275(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 151
LDI r2, 275
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
