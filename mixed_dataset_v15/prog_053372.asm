; DESCRIPTION: Renders a orange line between points (462, 166) and (470, 86).
; PLAN: r0=462(x1), r1=166(y1), r2=470(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 166
LDI r2, 470
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
