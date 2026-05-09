; DESCRIPTION: Composite: . Then Places a magenta circle of radius 73 at center (100, 158). Then Creates a cyan rectangular region at (122, 59) spanning 33 by 86 pixels.
; PLAN: r0=100(x), r1=158(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=122(x), r1=59(y), r2=33(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 73 at center (100, 158).
; PLAN: r0=100(x), r1=158(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 158
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (122, 59) spanning 33 by 86 pixels.
; PLAN: r0=122(x), r1=59(y), r2=33(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 59
LDI r2, 33
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
