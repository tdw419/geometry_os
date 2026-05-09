; DESCRIPTION: Renders a orange line between points (272, 241) and (150, 57).
; PLAN: r0=272(x1), r1=241(y1), r2=150(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 241
LDI r2, 150
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
