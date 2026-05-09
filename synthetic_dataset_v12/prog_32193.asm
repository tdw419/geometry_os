; DESCRIPTION: Composite: Sets a single magenta pixel at (342, 142) then Creates a white rectangular region at (219, 0) spanning 109 by 82 pixels then Places a green circle of radius 78 at center (287, 160).
; PLAN: r0=342(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=0(y), r7=109(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x), r11=160(y), r12=78(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 142
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 0
LDI r7, 109
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 160
LDI r12, 78
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
