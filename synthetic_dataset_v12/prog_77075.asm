; DESCRIPTION: Places a yellow line segment connecting (245, 150) to (283, 126).
; PLAN: r0=245(x1), r1=150(y1), r2=283(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 150
LDI r2, 283
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
