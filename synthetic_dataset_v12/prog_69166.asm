; DESCRIPTION: Composite: Places a yellow dot at position (329, 73) then Creates a white circular shape at (254, 202) with radius 46 then Places a cyan 91x92 rectangle at position (258, 65).
; PLAN: r0=329(x), r1=73(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=202(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x), r11=65(y), r12=91(width), r13=92(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 73
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 254
LDI r6, 202
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 65
LDI r12, 91
LDI r13, 92
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
