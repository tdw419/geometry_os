; DESCRIPTION: Composite: Draws a orange circle centered at (226, 181) with radius 12 then Renders a orange box of size 11x48 starting at (178, 5) then Sets a single red pixel at (439, 151).
; PLAN: r0=226(x), r1=181(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=5(y), r7=11(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=151(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 181
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 5
LDI r7, 11
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 151
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
