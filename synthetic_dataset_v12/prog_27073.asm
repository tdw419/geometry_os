; DESCRIPTION: Composite: Renders a white disk with center (169, 124) and radius 41 then Draws a white rectangle at (294, 43) with width 41 and height 115.
; PLAN: r0=169(x), r1=124(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=43(y), r7=41(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 124
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 43
LDI r7, 41
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
