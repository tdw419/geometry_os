; DESCRIPTION: Renders a orange line between points (211, 40) and (413, 59).
; PLAN: r0=211(x1), r1=40(y1), r2=413(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 40
LDI r2, 413
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
