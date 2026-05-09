; DESCRIPTION: Composite: . Then Draws a blue circle centered at (124, 181) with radius 74. Then Renders a cyan box of size 93x84 starting at (130, 6).
; PLAN: r0=124(x), r1=181(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=130(x), r1=6(y), r2=93(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (124, 181) with radius 74.
; PLAN: r0=124(x), r1=181(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 181
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 93x84 starting at (130, 6).
; PLAN: r0=130(x), r1=6(y), r2=93(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 6
LDI r2, 93
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
