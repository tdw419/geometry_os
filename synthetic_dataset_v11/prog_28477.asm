; DESCRIPTION: Renders a orange line between points (241, 197) and (75, 174).
; PLAN: r0=241(x1), r1=197(y1), r2=75(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 197
LDI r2, 75
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
