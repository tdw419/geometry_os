; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (131, 61) spanning 31 by 52 pixels. Then Renders a black disk with center (86, 113) and radius 49.
; PLAN: r0=131(x), r1=61(y), r2=31(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=86(x), r1=113(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (131, 61) spanning 31 by 52 pixels.
; PLAN: r0=131(x), r1=61(y), r2=31(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 61
LDI r2, 31
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (86, 113) and radius 49.
; PLAN: r0=86(x), r1=113(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 113
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
