; DESCRIPTION: Composite: Sets a single orange pixel at (439, 132) then Draws a black circle centered at (385, 88) with radius 39 then Places a cyan 68x77 rectangle at position (121, 93).
; PLAN: r0=439(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=88(y), r7=39(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x), r11=93(y), r12=68(width), r13=77(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 385
LDI r6, 88
LDI r7, 39
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 93
LDI r12, 68
LDI r13, 77
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
