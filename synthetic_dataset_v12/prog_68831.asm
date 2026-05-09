; DESCRIPTION: Renders a orange line between points (409, 8) and (504, 172).
; PLAN: r0=409(x1), r1=8(y1), r2=504(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 8
LDI r2, 504
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
