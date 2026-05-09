; DESCRIPTION: Composite: . Then Places a yellow circle of radius 22 at center (75, 65). Then Draws a black rectangle at (45, 141) with width 51 and height 37.
; PLAN: r0=75(x), r1=65(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=45(x), r1=141(y), r2=51(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 22 at center (75, 65).
; PLAN: r0=75(x), r1=65(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 65
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (45, 141) with width 51 and height 37.
; PLAN: r0=45(x), r1=141(y), r2=51(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 141
LDI r2, 51
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
