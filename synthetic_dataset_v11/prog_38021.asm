; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (207, 59) with radius 44. Then Creates a red rectangular region at (7, 144) spanning 112 by 12 pixels.
; PLAN: r0=207(x), r1=59(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=7(x), r1=144(y), r2=112(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (207, 59) with radius 44.
; PLAN: r0=207(x), r1=59(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 59
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (7, 144) spanning 112 by 12 pixels.
; PLAN: r0=7(x), r1=144(y), r2=112(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 144
LDI r2, 112
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
