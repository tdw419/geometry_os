; DESCRIPTION: Composite: Draws a purple circle centered at (439, 180) with radius 55 then Creates a white rectangular region at (138, 46) spanning 65 by 26 pixels.
; PLAN: r0=439(x), r1=180(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=46(y), r7=65(width), r8=26(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 180
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 46
LDI r7, 65
LDI r8, 26
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
