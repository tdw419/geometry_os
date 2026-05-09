; DESCRIPTION: Composite: Creates a red rectangular region at (30, 114) spanning 113 by 33 pixels then Sets a single red pixel at (273, 121) then Places a orange circle of radius 44 at center (241, 51).
; PLAN: r0=30(x), r1=114(y), r2=113(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=121(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=241(x), r11=51(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 114
LDI r2, 113
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 121
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 241
LDI r11, 51
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
