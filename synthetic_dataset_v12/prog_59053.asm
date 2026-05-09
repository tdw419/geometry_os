; DESCRIPTION: Renders a green line between points (471, 132) and (500, 34).
; PLAN: r0=471(x1), r1=132(y1), r2=500(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 132
LDI r2, 500
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
