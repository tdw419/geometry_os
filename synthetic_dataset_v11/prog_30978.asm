; DESCRIPTION: Composite: . Then Renders a yellow box of size 22x81 starting at (185, 41). Then Places a yellow circle of radius 56 at center (57, 185).
; PLAN: r0=185(x), r1=41(y), r2=22(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=57(x), r1=185(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 22x81 starting at (185, 41).
; PLAN: r0=185(x), r1=41(y), r2=22(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 41
LDI r2, 22
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 56 at center (57, 185).
; PLAN: r0=57(x), r1=185(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 185
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
