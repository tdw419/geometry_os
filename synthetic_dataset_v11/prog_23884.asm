; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (105, 111) to (6, 59). Then Renders a purple disk with center (70, 27) and radius 24.
; PLAN: r0=105(x1), r1=111(y1), r2=6(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=27(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (105, 111) to (6, 59).
; PLAN: r0=105(x1), r1=111(y1), r2=6(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 111
LDI r2, 6
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (70, 27) and radius 24.
; PLAN: r0=70(x), r1=27(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 27
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
