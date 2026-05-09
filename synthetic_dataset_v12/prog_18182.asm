; DESCRIPTION: Composite: Sets a single orange pixel at (391, 71) then Places a orange circle of radius 58 at center (301, 71) then Places a red 114x29 rectangle at position (5, 150).
; PLAN: r0=391(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=71(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x), r11=150(y), r12=114(width), r13=29(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 301
LDI r6, 71
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 150
LDI r12, 114
LDI r13, 29
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
