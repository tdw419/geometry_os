; DESCRIPTION: Composite: Draws a cyan rectangle at (72, 35) with width 12 and height 18 then Places a green circle of radius 10 at center (488, 98).
; PLAN: r0=72(x), r1=35(y), r2=12(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=98(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 35
LDI r2, 12
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 98
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
