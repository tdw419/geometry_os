; DESCRIPTION: Composite: . Then Places a red line segment connecting (29, 37) to (30, 19). Then Renders a yellow disk with center (214, 46) and radius 15.
; PLAN: r0=29(x1), r1=37(y1), r2=30(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=214(x), r1=46(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (29, 37) to (30, 19).
; PLAN: r0=29(x1), r1=37(y1), r2=30(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 37
LDI r2, 30
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (214, 46) and radius 15.
; PLAN: r0=214(x), r1=46(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 46
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
