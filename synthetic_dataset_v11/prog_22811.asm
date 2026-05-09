; DESCRIPTION: Composite: . Then Renders a magenta disk with center (156, 91) and radius 56. Then Draws a magenta rectangle at (28, 16) with width 106 and height 11.
; PLAN: r0=156(x), r1=91(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=28(x), r1=16(y), r2=106(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (156, 91) and radius 56.
; PLAN: r0=156(x), r1=91(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 91
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (28, 16) with width 106 and height 11.
; PLAN: r0=28(x), r1=16(y), r2=106(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 16
LDI r2, 106
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
