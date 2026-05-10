; DESCRIPTION: Composite: Renders a orange disk with center (347, 80) and radius 66 then Places a orange 33x91 rectangle at position (45, 35) then Places a white dot at position (235, 116).
; PLAN: r0=347(x), r1=80(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=35(y), r7=33(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=235(x), r11=116(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 80
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 35
LDI r7, 33
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 116
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
