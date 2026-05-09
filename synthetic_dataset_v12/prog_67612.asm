; DESCRIPTION: Composite: Creates a purple circular shape at (184, 133) with radius 37 then Creates a blue rectangular region at (202, 41) spanning 107 by 31 pixels then Places a blue dot at position (377, 42).
; PLAN: r0=184(x), r1=133(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=41(y), r7=107(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x), r11=42(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 133
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 41
LDI r7, 107
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 42
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
