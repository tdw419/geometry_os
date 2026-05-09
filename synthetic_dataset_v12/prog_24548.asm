; DESCRIPTION: Composite: Draws a cyan circle centered at (429, 128) with radius 73 then Places a yellow dot at position (304, 200) then Places a yellow 94x74 rectangle at position (235, 22).
; PLAN: r0=429(x), r1=128(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=22(y), r12=94(width), r13=74(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 128
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 235
LDI r11, 22
LDI r12, 94
LDI r13, 74
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
