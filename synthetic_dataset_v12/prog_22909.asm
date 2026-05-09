; DESCRIPTION: Renders a orange line between points (352, 209) and (155, 225).
; PLAN: r0=352(x1), r1=209(y1), r2=155(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 209
LDI r2, 155
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
