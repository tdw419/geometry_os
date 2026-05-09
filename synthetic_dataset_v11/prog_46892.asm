; DESCRIPTION: Composite: . Then Renders a white disk with center (93, 129) and radius 60. Then Creates a green rectangular region at (132, 18) spanning 98 by 109 pixels.
; PLAN: r0=93(x), r1=129(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x), r1=18(y), r2=98(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (93, 129) and radius 60.
; PLAN: r0=93(x), r1=129(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 129
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (132, 18) spanning 98 by 109 pixels.
; PLAN: r0=132(x), r1=18(y), r2=98(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 18
LDI r2, 98
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
