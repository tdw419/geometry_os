; DESCRIPTION: Composite: . Then Renders a orange line between points (15, 59) and (23, 192). Then Places a orange circle of radius 59 at center (85, 77).
; PLAN: r0=15(x1), r1=59(y1), r2=23(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=85(x), r1=77(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (15, 59) and (23, 192).
; PLAN: r0=15(x1), r1=59(y1), r2=23(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 59
LDI r2, 23
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 59 at center (85, 77).
; PLAN: r0=85(x), r1=77(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 77
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
