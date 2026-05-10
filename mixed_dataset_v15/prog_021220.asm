; DESCRIPTION: Composite: Draws a cyan circle centered at (319, 24) with radius 22 then Sets a single yellow pixel at (311, 150) then Places a yellow 12x66 rectangle at position (221, 32).
; PLAN: r0=319(x), r1=24(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=150(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=221(x), r11=32(y), r12=12(width), r13=66(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 24
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 150
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 221
LDI r11, 32
LDI r12, 12
LDI r13, 66
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
