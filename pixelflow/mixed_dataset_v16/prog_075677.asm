; DESCRIPTION: Composite: Renders a white disk with center (288, 105) and radius 80 then Renders a purple box of size 12x14 starting at (21, 238).
; PLAN: r0=288(x), r1=105(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=238(y), r7=12(width), r8=14(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 105
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 238
LDI r7, 12
LDI r8, 14
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
