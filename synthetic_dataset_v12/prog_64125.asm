; DESCRIPTION: Renders a orange line between points (321, 93) and (24, 187).
; PLAN: r0=321(x1), r1=93(y1), r2=24(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 93
LDI r2, 24
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
