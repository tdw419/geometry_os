; DESCRIPTION: Composite: . Then Renders a red box of size 12x71 starting at (134, 14). Then Renders a white disk with center (97, 144) and radius 16.
; PLAN: r0=134(x), r1=14(y), r2=12(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=97(x), r1=144(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 12x71 starting at (134, 14).
; PLAN: r0=134(x), r1=14(y), r2=12(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 14
LDI r2, 12
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (97, 144) and radius 16.
; PLAN: r0=97(x), r1=144(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 144
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
