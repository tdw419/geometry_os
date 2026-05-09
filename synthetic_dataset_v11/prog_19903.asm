; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (154, 0) with width 21 and height 74. Then Places a blue dot at position (109, 106).
; PLAN: r0=154(x), r1=0(y), r2=21(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=109(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (154, 0) with width 21 and height 74.
; PLAN: r0=154(x), r1=0(y), r2=21(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 0
LDI r2, 21
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (109, 106).
; PLAN: r0=109(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 106
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
