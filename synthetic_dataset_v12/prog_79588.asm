; DESCRIPTION: Composite: Sets a single red pixel at (299, 164) then Places a white 57x102 rectangle at position (360, 119) then Renders a red disk with center (65, 102) and radius 49.
; PLAN: r0=299(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=119(y), r7=57(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x), r11=102(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 299
LDI r1, 164
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 360
LDI r6, 119
LDI r7, 57
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 102
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
