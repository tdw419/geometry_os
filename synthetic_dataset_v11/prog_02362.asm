; DESCRIPTION: Places a orange line segment connecting (202, 129) to (91, 126).
; PLAN: r0=202(x1), r1=129(y1), r2=91(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 129
LDI r2, 91
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
