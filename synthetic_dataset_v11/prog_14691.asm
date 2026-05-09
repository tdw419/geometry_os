; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (169, 35) spanning 28 by 114 pixels. Then Places a magenta circle of radius 31 at center (122, 214).
; PLAN: r0=169(x), r1=35(y), r2=28(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=122(x), r1=214(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a blue rectangular region at (169, 35) spanning 28 by 114 pixels.
; PLAN: r0=169(x), r1=35(y), r2=28(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 35
LDI r2, 28
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 31 at center (122, 214).
; PLAN: r0=122(x), r1=214(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 214
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
