; DESCRIPTION: Composite: . Then Renders a orange disk with center (159, 52) and radius 42. Then Creates a red rectangular region at (15, 80) spanning 75 by 78 pixels.
; PLAN: r0=159(x), r1=52(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=15(x), r1=80(y), r2=75(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (159, 52) and radius 42.
; PLAN: r0=159(x), r1=52(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 52
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (15, 80) spanning 75 by 78 pixels.
; PLAN: r0=15(x), r1=80(y), r2=75(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 80
LDI r2, 75
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
