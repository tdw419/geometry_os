; DESCRIPTION: Renders a orange line between points (286, 197) and (240, 252).
; PLAN: r0=286(x1), r1=197(y1), r2=240(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 197
LDI r2, 240
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
