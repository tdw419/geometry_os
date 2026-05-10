; DESCRIPTION: Composite: Creates a green circular shape at (346, 95) with radius 55 then Creates a orange rectangular region at (17, 54) spanning 99 by 90 pixels then Places a red dot at position (239, 223).
; PLAN: r0=346(x), r1=95(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=54(y), r7=99(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=223(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 95
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 54
LDI r7, 99
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 223
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
