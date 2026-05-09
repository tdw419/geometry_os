; DESCRIPTION: Composite: . Then Creates a black rectangular region at (35, 123) spanning 96 by 88 pixels. Then Sets a single green pixel at (15, 85).
; PLAN: r0=35(x), r1=123(y), r2=96(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=15(x), r1=85(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (35, 123) spanning 96 by 88 pixels.
; PLAN: r0=35(x), r1=123(y), r2=96(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 123
LDI r2, 96
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (15, 85).
; PLAN: r0=15(x), r1=85(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 85
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
