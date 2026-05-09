; DESCRIPTION: Renders a orange line between points (471, 113) and (313, 208).
; PLAN: r0=471(x1), r1=113(y1), r2=313(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 113
LDI r2, 313
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
