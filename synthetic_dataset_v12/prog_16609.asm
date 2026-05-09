; DESCRIPTION: Renders a orange line between points (285, 24) and (260, 220).
; PLAN: r0=285(x1), r1=24(y1), r2=260(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 24
LDI r2, 260
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
