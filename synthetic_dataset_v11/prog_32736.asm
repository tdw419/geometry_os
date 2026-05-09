; DESCRIPTION: Renders a orange line between points (87, 56) and (103, 225).
; PLAN: r0=87(x1), r1=56(y1), r2=103(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 56
LDI r2, 103
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
