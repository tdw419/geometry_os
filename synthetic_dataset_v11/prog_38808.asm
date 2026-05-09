; DESCRIPTION: Composite: . Then Places a yellow circle of radius 18 at center (227, 124). Then Draws a yellow rectangle at (6, 61) with width 37 and height 120.
; PLAN: r0=227(x), r1=124(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=6(x), r1=61(y), r2=37(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 18 at center (227, 124).
; PLAN: r0=227(x), r1=124(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 124
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (6, 61) with width 37 and height 120.
; PLAN: r0=6(x), r1=61(y), r2=37(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 61
LDI r2, 37
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
