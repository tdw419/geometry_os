; DESCRIPTION: Composite: Draws a red rectangle at (192, 58) with width 35 and height 31 then Creates a white circular shape at (384, 115) with radius 77 then Places a white dot at position (120, 16).
; PLAN: r0=192(x), r1=58(y), r2=35(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=115(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=16(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 192
LDI r1, 58
LDI r2, 35
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 115
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 16
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
