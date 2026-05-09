; DESCRIPTION: Composite: . Then Places a red circle of radius 37 at center (56, 92). Then Renders a orange line between points (7, 212) and (83, 241).
; PLAN: r0=56(x), r1=92(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=7(x1), r1=212(y1), r2=83(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 37 at center (56, 92).
; PLAN: r0=56(x), r1=92(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 92
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange line between points (7, 212) and (83, 241).
; PLAN: r0=7(x1), r1=212(y1), r2=83(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 212
LDI r2, 83
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
