; DESCRIPTION: Composite: Creates a blue rectangular region at (230, 58) spanning 58 by 43 pixels then Places a magenta circle of radius 44 at center (174, 149) then Sets a single purple pixel at (1, 51).
; PLAN: r0=230(x), r1=58(y), r2=58(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=149(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=51(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 58
LDI r2, 58
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 149
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 51
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
