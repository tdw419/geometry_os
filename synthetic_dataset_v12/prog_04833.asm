; DESCRIPTION: Composite: Sets a single yellow pixel at (264, 186) then Creates a magenta circular shape at (73, 115) with radius 30 then Places a purple 61x94 rectangle at position (207, 149).
; PLAN: r0=264(x), r1=186(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=115(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=207(x), r11=149(y), r12=61(width), r13=94(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 186
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 73
LDI r6, 115
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 207
LDI r11, 149
LDI r12, 61
LDI r13, 94
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
