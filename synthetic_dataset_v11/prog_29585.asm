; DESCRIPTION: Composite: . Then Renders a cyan disk with center (115, 77) and radius 65. Then Creates a green rectangular region at (122, 56) spanning 57 by 111 pixels.
; PLAN: r0=115(x), r1=77(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=122(x), r1=56(y), r2=57(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (115, 77) and radius 65.
; PLAN: r0=115(x), r1=77(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 77
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (122, 56) spanning 57 by 111 pixels.
; PLAN: r0=122(x), r1=56(y), r2=57(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 56
LDI r2, 57
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
