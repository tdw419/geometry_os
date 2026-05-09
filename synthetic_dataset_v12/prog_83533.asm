; DESCRIPTION: Composite: Sets a single green pixel at (306, 31) then Renders a white disk with center (133, 159) and radius 41 then Renders a red box of size 49x76 starting at (267, 103).
; PLAN: r0=306(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=159(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=267(x), r11=103(y), r12=49(width), r13=76(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 31
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 133
LDI r6, 159
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 267
LDI r11, 103
LDI r12, 49
LDI r13, 76
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
