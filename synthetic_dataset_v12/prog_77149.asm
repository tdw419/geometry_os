; DESCRIPTION: Composite: Draws a blue rectangle at (240, 29) with width 120 and height 83 then Renders a white line between points (478, 41) and (289, 224).
; PLAN: r0=240(x), r1=29(y), r2=120(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x1), r6=41(y1), r7=289(x2), r8=224(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 29
LDI r2, 120
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 41
LDI r7, 289
LDI r8, 224
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
