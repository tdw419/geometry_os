; DESCRIPTION: Composite: . Then Creates a green rectangular region at (85, 17) spanning 19 by 116 pixels. Then Renders a purple disk with center (199, 195) and radius 37.
; PLAN: r0=85(x), r1=17(y), r2=19(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=199(x), r1=195(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (85, 17) spanning 19 by 116 pixels.
; PLAN: r0=85(x), r1=17(y), r2=19(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 17
LDI r2, 19
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (199, 195) and radius 37.
; PLAN: r0=199(x), r1=195(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 195
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
