; DESCRIPTION: Composite: Draws a white circle centered at (434, 75) with radius 34 then Creates a green rectangular region at (86, 142) spanning 100 by 67 pixels then Places a cyan dot at position (317, 131).
; PLAN: r0=434(x), r1=75(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=142(y), r7=100(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x), r11=131(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 75
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 142
LDI r7, 100
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 131
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
