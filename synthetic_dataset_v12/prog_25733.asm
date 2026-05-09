; DESCRIPTION: Composite: Places a blue circle of radius 51 at center (409, 169) then Draws a white rectangle at (197, 81) with width 49 and height 55.
; PLAN: r0=409(x), r1=169(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=81(y), r7=49(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 169
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 81
LDI r7, 49
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
