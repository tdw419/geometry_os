; DESCRIPTION: Composite: . Then Places a red circle of radius 18 at center (112, 156). Then Draws a yellow rectangle at (37, 132) with width 112 and height 96.
; PLAN: r0=112(x), r1=156(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=37(x), r1=132(y), r2=112(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 18 at center (112, 156).
; PLAN: r0=112(x), r1=156(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 156
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (37, 132) with width 112 and height 96.
; PLAN: r0=37(x), r1=132(y), r2=112(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 132
LDI r2, 112
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
