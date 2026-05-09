; DESCRIPTION: Composite: Draws a purple circle centered at (141, 165) with radius 57 then Places a black 57x29 rectangle at position (186, 46).
; PLAN: r0=141(x), r1=165(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=46(y), r7=57(width), r8=29(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 165
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 46
LDI r7, 57
LDI r8, 29
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
