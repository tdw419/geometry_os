; DESCRIPTION: Composite: Renders a white box of size 88x117 starting at (267, 136) then Renders a orange disk with center (234, 98) and radius 75.
; PLAN: r0=267(x), r1=136(y), r2=88(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=98(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 267
LDI r1, 136
LDI r2, 88
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 98
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
