; DESCRIPTION: Renders a white line between points (132, 48) and (34, 159).
; PLAN: r0=132(x1), r1=48(y1), r2=34(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 48
LDI r2, 34
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
