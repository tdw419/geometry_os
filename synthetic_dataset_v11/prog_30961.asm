; DESCRIPTION: Composite: . Then Renders a blue box of size 119x109 starting at (83, 40). Then Draws a magenta circle centered at (146, 186) with radius 43.
; PLAN: r0=83(x), r1=40(y), r2=119(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=146(x), r1=186(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 119x109 starting at (83, 40).
; PLAN: r0=83(x), r1=40(y), r2=119(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 40
LDI r2, 119
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (146, 186) with radius 43.
; PLAN: r0=146(x), r1=186(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 186
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
