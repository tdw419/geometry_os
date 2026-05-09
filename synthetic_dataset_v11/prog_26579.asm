; DESCRIPTION: Composite: . Then Renders a white box of size 35x34 starting at (13, 48). Then Renders a green disk with center (102, 139) and radius 76.
; PLAN: r0=13(x), r1=48(y), r2=35(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=102(x), r1=139(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 35x34 starting at (13, 48).
; PLAN: r0=13(x), r1=48(y), r2=35(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 48
LDI r2, 35
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (102, 139) and radius 76.
; PLAN: r0=102(x), r1=139(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 139
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
