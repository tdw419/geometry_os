; DESCRIPTION: Places a orange line segment connecting (27, 186) to (324, 148).
; PLAN: r0=27(x1), r1=186(y1), r2=324(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 186
LDI r2, 324
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
