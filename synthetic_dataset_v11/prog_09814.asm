; DESCRIPTION: Composite: . Then Creates a black rectangular region at (210, 134) spanning 32 by 106 pixels. Then Renders a white disk with center (125, 86) and radius 76.
; PLAN: r0=210(x), r1=134(y), r2=32(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=86(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (210, 134) spanning 32 by 106 pixels.
; PLAN: r0=210(x), r1=134(y), r2=32(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 134
LDI r2, 32
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (125, 86) and radius 76.
; PLAN: r0=125(x), r1=86(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 86
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
