; DESCRIPTION: Composite: Creates a orange rectangular region at (223, 6) spanning 81 by 71 pixels then Sets a single white pixel at (30, 179) then Places a orange circle of radius 65 at center (331, 190).
; PLAN: r0=223(x), r1=6(y), r2=81(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x), r6=179(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=331(x), r11=190(y), r12=65(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 223
LDI r1, 6
LDI r2, 81
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 179
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 331
LDI r11, 190
LDI r12, 65
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
