; DESCRIPTION: Composite: . Then Draws a green rectangle at (98, 0) with width 52 and height 47. Then Renders a yellow disk with center (187, 66) and radius 51.
; PLAN: r0=98(x), r1=0(y), r2=52(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x), r1=66(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green rectangle at (98, 0) with width 52 and height 47.
; PLAN: r0=98(x), r1=0(y), r2=52(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 0
LDI r2, 52
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (187, 66) and radius 51.
; PLAN: r0=187(x), r1=66(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 66
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
