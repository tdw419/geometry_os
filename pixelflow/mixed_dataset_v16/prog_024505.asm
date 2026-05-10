; DESCRIPTION: Composite: Draws a white rectangle at (2, 145) with width 83 and height 76 then Places a red circle of radius 11 at center (161, 112).
; PLAN: r0=2(x), r1=145(y), r2=83(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=112(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 145
LDI r2, 83
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 112
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
