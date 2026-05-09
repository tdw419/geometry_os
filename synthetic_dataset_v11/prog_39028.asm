; DESCRIPTION: Composite: . Then Creates a black rectangular region at (18, 76) spanning 20 by 101 pixels. Then Places a blue circle of radius 42 at center (60, 190).
; PLAN: r0=18(x), r1=76(y), r2=20(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=60(x), r1=190(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (18, 76) spanning 20 by 101 pixels.
; PLAN: r0=18(x), r1=76(y), r2=20(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 76
LDI r2, 20
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 42 at center (60, 190).
; PLAN: r0=60(x), r1=190(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 190
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
