; DESCRIPTION: Composite: Creates a cyan rectangular region at (416, 98) spanning 10 by 54 pixels then Creates a cyan circular shape at (474, 212) with radius 33 then Places a white dot at position (22, 186).
; PLAN: r0=416(x), r1=98(y), r2=10(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=212(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=186(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 98
LDI r2, 10
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 212
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 186
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
