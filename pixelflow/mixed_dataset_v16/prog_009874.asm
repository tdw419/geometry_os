; DESCRIPTION: Composite: Places a cyan circle of radius 20 at center (438, 120) then Sets a single orange pixel at (89, 31) then Draws a red rectangle at (174, 88) with width 103 and height 84.
; PLAN: r0=438(x), r1=120(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=31(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=88(y), r12=103(width), r13=84(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 120
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 31
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 174
LDI r11, 88
LDI r12, 103
LDI r13, 84
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
