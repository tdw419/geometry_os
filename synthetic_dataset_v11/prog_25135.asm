; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (127, 81) spanning 108 by 67 pixels. Then Places a magenta circle of radius 78 at center (111, 85).
; PLAN: r0=127(x), r1=81(y), r2=108(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=85(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a purple rectangular region at (127, 81) spanning 108 by 67 pixels.
; PLAN: r0=127(x), r1=81(y), r2=108(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 81
LDI r2, 108
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 78 at center (111, 85).
; PLAN: r0=111(x), r1=85(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 85
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
