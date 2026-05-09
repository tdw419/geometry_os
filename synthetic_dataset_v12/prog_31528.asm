; DESCRIPTION: Renders a orange line between points (255, 197) and (159, 35).
; PLAN: r0=255(x1), r1=197(y1), r2=159(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 197
LDI r2, 159
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
