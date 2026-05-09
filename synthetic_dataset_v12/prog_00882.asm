; DESCRIPTION: Composite: Sets a single white pixel at (263, 199) then Places a black circle of radius 73 at center (258, 110) then Places a green 15x10 rectangle at position (352, 243).
; PLAN: r0=263(x), r1=199(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=110(y), r7=73(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x), r11=243(y), r12=15(width), r13=10(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 199
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 110
LDI r7, 73
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 243
LDI r12, 15
LDI r13, 10
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
