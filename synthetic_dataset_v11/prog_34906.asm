; DESCRIPTION: Composite: . Then Creates a red rectangular region at (136, 29) spanning 26 by 107 pixels. Then Renders a white disk with center (100, 112) and radius 70.
; PLAN: r0=136(x), r1=29(y), r2=26(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x), r1=112(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (136, 29) spanning 26 by 107 pixels.
; PLAN: r0=136(x), r1=29(y), r2=26(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 29
LDI r2, 26
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (100, 112) and radius 70.
; PLAN: r0=100(x), r1=112(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 112
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
