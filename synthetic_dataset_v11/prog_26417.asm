; DESCRIPTION: Renders a orange line between points (206, 109) and (4, 48).
; PLAN: r0=206(x1), r1=109(y1), r2=4(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 109
LDI r2, 4
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
