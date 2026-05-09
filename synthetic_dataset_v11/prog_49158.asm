; DESCRIPTION: Composite: . Then Renders a cyan disk with center (151, 115) and radius 54. Then Creates a blue rectangular region at (62, 90) spanning 45 by 76 pixels.
; PLAN: r0=151(x), r1=115(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=62(x), r1=90(y), r2=45(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (151, 115) and radius 54.
; PLAN: r0=151(x), r1=115(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 115
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (62, 90) spanning 45 by 76 pixels.
; PLAN: r0=62(x), r1=90(y), r2=45(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 90
LDI r2, 45
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
