; DESCRIPTION: Composite: Draws a cyan circle centered at (304, 44) with radius 37 then Places a black dot at position (182, 3) then Creates a yellow rectangular region at (177, 33) spanning 51 by 100 pixels.
; PLAN: r0=304(x), r1=44(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=3(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=33(y), r12=51(width), r13=100(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 44
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 3
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 177
LDI r11, 33
LDI r12, 51
LDI r13, 100
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
