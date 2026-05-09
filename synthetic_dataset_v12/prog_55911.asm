; DESCRIPTION: Renders a orange line between points (470, 7) and (10, 207).
; PLAN: r0=470(x1), r1=7(y1), r2=10(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 7
LDI r2, 10
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
