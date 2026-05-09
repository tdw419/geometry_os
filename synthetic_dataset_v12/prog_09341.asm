; DESCRIPTION: Composite: Draws a green rectangle at (443, 131) with width 24 and height 88 then Draws a cyan circle centered at (107, 112) with radius 29.
; PLAN: r0=443(x), r1=131(y), r2=24(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=112(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 131
LDI r2, 24
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 112
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
