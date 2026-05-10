; DESCRIPTION: Composite: Places a white dot at position (14, 115) then Draws a white rectangle at (132, 124) with width 114 and height 89 then Places a white circle of radius 33 at center (410, 50).
; PLAN: r0=14(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=124(y), r7=114(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=50(y), r12=33(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 14
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 124
LDI r7, 114
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 50
LDI r12, 33
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
