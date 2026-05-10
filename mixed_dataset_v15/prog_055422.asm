; DESCRIPTION: Composite: Sets a single green pixel at (391, 23) then Creates a red circular shape at (358, 148) with radius 77 then Places a green 98x16 rectangle at position (87, 127).
; PLAN: r0=391(x), r1=23(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=148(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x), r11=127(y), r12=98(width), r13=16(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 23
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 358
LDI r6, 148
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 127
LDI r12, 98
LDI r13, 16
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
