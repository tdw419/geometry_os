; DESCRIPTION: Composite: Sets a single green pixel at (301, 146) then Places a red 88x59 rectangle at position (112, 45) then Creates a white circular shape at (172, 196) with radius 35.
; PLAN: r0=301(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=45(y), r7=88(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=196(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 146
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 112
LDI r6, 45
LDI r7, 88
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 196
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
