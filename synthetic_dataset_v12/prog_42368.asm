; DESCRIPTION: Composite: Sets a single black pixel at (170, 243) then Renders a black box of size 88x63 starting at (404, 148) then Renders a white disk with center (26, 117) and radius 26.
; PLAN: r0=170(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=148(y), r7=88(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=26(x), r11=117(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 243
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 404
LDI r6, 148
LDI r7, 88
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 117
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
