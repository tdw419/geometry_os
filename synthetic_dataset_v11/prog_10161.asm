; DESCRIPTION: Composite: . Then Renders a cyan disk with center (117, 105) and radius 24. Then Creates a black rectangular region at (78, 122) spanning 63 by 30 pixels.
; PLAN: r0=117(x), r1=105(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=78(x), r1=122(y), r2=63(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (117, 105) and radius 24.
; PLAN: r0=117(x), r1=105(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 105
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a black rectangular region at (78, 122) spanning 63 by 30 pixels.
; PLAN: r0=78(x), r1=122(y), r2=63(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 122
LDI r2, 63
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
