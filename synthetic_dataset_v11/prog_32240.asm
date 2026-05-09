; DESCRIPTION: Composite: . Then Draws a orange rectangle at (145, 211) with width 28 and height 23. Then Places a red circle of radius 59 at center (153, 71).
; PLAN: r0=145(x), r1=211(y), r2=28(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=153(x), r1=71(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (145, 211) with width 28 and height 23.
; PLAN: r0=145(x), r1=211(y), r2=28(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 211
LDI r2, 28
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 59 at center (153, 71).
; PLAN: r0=153(x), r1=71(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 71
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
