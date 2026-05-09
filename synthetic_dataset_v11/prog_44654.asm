; DESCRIPTION: Composite: . Then Renders a orange disk with center (82, 19) and radius 17. Then Creates a blue rectangular region at (47, 77) spanning 52 by 44 pixels.
; PLAN: r0=82(x), r1=19(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=47(x), r1=77(y), r2=52(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (82, 19) and radius 17.
; PLAN: r0=82(x), r1=19(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 19
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (47, 77) spanning 52 by 44 pixels.
; PLAN: r0=47(x), r1=77(y), r2=52(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 77
LDI r2, 52
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
