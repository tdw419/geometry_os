; DESCRIPTION: Renders a orange line between points (286, 37) and (70, 208).
; PLAN: r0=286(x1), r1=37(y1), r2=70(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 37
LDI r2, 70
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
