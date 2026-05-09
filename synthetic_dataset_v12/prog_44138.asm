; DESCRIPTION: Places a orange line segment connecting (269, 186) to (71, 68).
; PLAN: r0=269(x1), r1=186(y1), r2=71(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 186
LDI r2, 71
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
