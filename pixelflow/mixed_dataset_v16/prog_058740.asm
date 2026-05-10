; DESCRIPTION: Composite: Draws a white circle centered at (118, 167) with radius 45 then Places a red 110x46 rectangle at position (388, 116) then Sets a single white pixel at (431, 171).
; PLAN: r0=118(x), r1=167(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x), r6=116(y), r7=110(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x), r11=171(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 118
LDI r1, 167
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 116
LDI r7, 110
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 171
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
