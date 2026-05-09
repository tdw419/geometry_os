; DESCRIPTION: Composite: Renders a green box of size 51x41 starting at (335, 24) then Renders a black disk with center (203, 148) and radius 53.
; PLAN: r0=335(x), r1=24(y), r2=51(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=148(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 24
LDI r2, 51
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 148
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
