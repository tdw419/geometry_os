; DESCRIPTION: Renders a orange line between points (191, 126) and (428, 19).
; PLAN: r0=191(x1), r1=126(y1), r2=428(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 126
LDI r2, 428
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
