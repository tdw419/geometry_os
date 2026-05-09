; DESCRIPTION: Composite: . Then Renders a cyan disk with center (88, 85) and radius 15. Then Renders a black box of size 18x105 starting at (134, 84).
; PLAN: r0=88(x), r1=85(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=134(x), r1=84(y), r2=18(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (88, 85) and radius 15.
; PLAN: r0=88(x), r1=85(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 85
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black box of size 18x105 starting at (134, 84).
; PLAN: r0=134(x), r1=84(y), r2=18(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 84
LDI r2, 18
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
