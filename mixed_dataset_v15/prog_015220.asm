; DESCRIPTION: Renders a orange line between points (183, 254) and (209, 33).
; PLAN: r0=183(x1), r1=254(y1), r2=209(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 254
LDI r2, 209
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
