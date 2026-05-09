; DESCRIPTION: Composite: . Then Places a magenta circle of radius 39 at center (105, 201). Then Creates a cyan rectangular region at (49, 55) spanning 84 by 25 pixels.
; PLAN: r0=105(x), r1=201(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x), r1=55(y), r2=84(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 39 at center (105, 201).
; PLAN: r0=105(x), r1=201(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 201
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (49, 55) spanning 84 by 25 pixels.
; PLAN: r0=49(x), r1=55(y), r2=84(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 55
LDI r2, 84
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
