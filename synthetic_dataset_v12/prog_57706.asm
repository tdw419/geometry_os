; DESCRIPTION: Places a yellow line segment connecting (504, 2) to (9, 91).
; PLAN: r0=504(x1), r1=2(y1), r2=9(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 2
LDI r2, 9
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
