; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (92, 178) with radius 65. Then Draws a black rectangle at (90, 61) with width 75 and height 76.
; PLAN: r0=92(x), r1=178(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=90(x), r1=61(y), r2=75(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (92, 178) with radius 65.
; PLAN: r0=92(x), r1=178(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 178
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (90, 61) with width 75 and height 76.
; PLAN: r0=90(x), r1=61(y), r2=75(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 61
LDI r2, 75
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
