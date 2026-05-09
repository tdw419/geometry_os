; DESCRIPTION: Composite: Places a red circle of radius 39 at center (39, 51) then Draws a white rectangle at (4, 100) with width 100 and height 110 then Sets a single green pixel at (234, 166).
; PLAN: r0=39(x), r1=51(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=100(y), r7=100(width), r8=110(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=166(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 51
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 100
LDI r7, 100
LDI r8, 110
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 166
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
