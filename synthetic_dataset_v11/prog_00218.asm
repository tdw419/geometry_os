; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (117, 157) with radius 61. Then Creates a magenta rectangular region at (186, 10) spanning 25 by 67 pixels.
; PLAN: r0=117(x), r1=157(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x), r1=10(y), r2=25(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (117, 157) with radius 61.
; PLAN: r0=117(x), r1=157(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 157
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (186, 10) spanning 25 by 67 pixels.
; PLAN: r0=186(x), r1=10(y), r2=25(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 10
LDI r2, 25
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
