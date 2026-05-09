; DESCRIPTION: Composite: Creates a blue circular shape at (194, 93) with radius 31 then Places a red 53x108 rectangle at position (201, 41) then Sets a single white pixel at (269, 223).
; PLAN: r0=194(x), r1=93(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=41(y), r7=53(width), r8=108(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=223(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 93
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 41
LDI r7, 53
LDI r8, 108
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 223
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
