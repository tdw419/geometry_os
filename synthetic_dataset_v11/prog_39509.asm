; DESCRIPTION: Composite: . Then Draws a blue rectangle at (75, 87) with width 120 and height 47. Then Draws a black circle centered at (156, 163) with radius 27.
; PLAN: r0=75(x), r1=87(y), r2=120(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=156(x), r1=163(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (75, 87) with width 120 and height 47.
; PLAN: r0=75(x), r1=87(y), r2=120(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 87
LDI r2, 120
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (156, 163) with radius 27.
; PLAN: r0=156(x), r1=163(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 163
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
