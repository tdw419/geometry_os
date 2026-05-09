; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (174, 151) with width 20 and height 31. Then Draws a yellow circle centered at (101, 191) with radius 11.
; PLAN: r0=174(x), r1=151(y), r2=20(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x), r1=191(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (174, 151) with width 20 and height 31.
; PLAN: r0=174(x), r1=151(y), r2=20(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 151
LDI r2, 20
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (101, 191) with radius 11.
; PLAN: r0=101(x), r1=191(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 191
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
