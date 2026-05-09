; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (210, 83) with radius 12. Then Creates a blue rectangular region at (67, 89) spanning 63 by 102 pixels.
; PLAN: r0=210(x), r1=83(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=67(x), r1=89(y), r2=63(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (210, 83) with radius 12.
; PLAN: r0=210(x), r1=83(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 83
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (67, 89) spanning 63 by 102 pixels.
; PLAN: r0=67(x), r1=89(y), r2=63(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 89
LDI r2, 63
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
