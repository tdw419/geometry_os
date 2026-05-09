; DESCRIPTION: Places a orange line segment connecting (209, 106) to (245, 126).
; PLAN: r0=209(x1), r1=106(y1), r2=245(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 106
LDI r2, 245
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
