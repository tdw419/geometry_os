; DESCRIPTION: Composite: Places a yellow 116x51 rectangle at position (347, 87) then Creates a magenta circular shape at (37, 182) with radius 16 then Places a orange dot at position (459, 125).
; PLAN: r0=347(x), r1=87(y), r2=116(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=182(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=459(x), r11=125(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 87
LDI r2, 116
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 182
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 459
LDI r11, 125
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
