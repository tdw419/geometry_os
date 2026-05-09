; DESCRIPTION: Renders a orange line between points (240, 162) and (497, 204).
; PLAN: r0=240(x1), r1=162(y1), r2=497(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 162
LDI r2, 497
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
