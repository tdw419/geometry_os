; DESCRIPTION: Composite: Draws a white rectangle at (65, 123) with width 49 and height 44 then Renders a cyan line between points (289, 120) and (199, 78) then Places a white circle of radius 39 at center (220, 109).
; PLAN: r0=65(x), r1=123(y), r2=49(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x1), r6=120(y1), r7=199(x2), r8=78(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=109(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 123
LDI r2, 49
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 120
LDI r7, 199
LDI r8, 78
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 109
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
