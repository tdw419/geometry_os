; DESCRIPTION: Composite: . Then Creates a red rectangular region at (194, 78) spanning 28 by 76 pixels. Then Places a purple circle of radius 12 at center (176, 83).
; PLAN: r0=194(x), r1=78(y), r2=28(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x), r1=83(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (194, 78) spanning 28 by 76 pixels.
; PLAN: r0=194(x), r1=78(y), r2=28(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 78
LDI r2, 28
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 12 at center (176, 83).
; PLAN: r0=176(x), r1=83(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 83
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
