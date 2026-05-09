; DESCRIPTION: Composite: . Then Places a yellow circle of radius 62 at center (187, 137). Then Draws a green rectangle at (37, 200) with width 24 and height 10.
; PLAN: r0=187(x), r1=137(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=37(x), r1=200(y), r2=24(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 62 at center (187, 137).
; PLAN: r0=187(x), r1=137(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 137
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (37, 200) with width 24 and height 10.
; PLAN: r0=37(x), r1=200(y), r2=24(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 200
LDI r2, 24
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
