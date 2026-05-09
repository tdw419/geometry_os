; DESCRIPTION: Composite: Places a cyan 48x35 rectangle at position (329, 116) then Draws a black circle centered at (85, 110) with radius 62 then Sets a single green pixel at (79, 171).
; PLAN: r0=329(x), r1=116(y), r2=48(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=110(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=171(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 116
LDI r2, 48
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 110
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 171
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
