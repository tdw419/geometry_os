; DESCRIPTION: Composite: Creates a cyan circular shape at (233, 100) with radius 49 then Sets a single magenta pixel at (355, 26) then Places a yellow 45x12 rectangle at position (293, 213).
; PLAN: r0=233(x), r1=100(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=26(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=293(x), r11=213(y), r12=45(width), r13=12(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 100
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 26
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 293
LDI r11, 213
LDI r12, 45
LDI r13, 12
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
