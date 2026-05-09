; DESCRIPTION: Composite: . Then Renders a white box of size 93x34 starting at (4, 213). Then Creates a black circular shape at (108, 130) with radius 66.
; PLAN: r0=4(x), r1=213(y), r2=93(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x), r1=130(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 93x34 starting at (4, 213).
; PLAN: r0=4(x), r1=213(y), r2=93(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 213
LDI r2, 93
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (108, 130) with radius 66.
; PLAN: r0=108(x), r1=130(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 130
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
