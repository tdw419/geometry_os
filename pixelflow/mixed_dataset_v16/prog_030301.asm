; DESCRIPTION: Composite: Places a orange dot at position (391, 236) then Renders a yellow disk with center (182, 105) and radius 77 then Places a purple 73x49 rectangle at position (410, 114).
; PLAN: r0=391(x), r1=236(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=105(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x), r11=114(y), r12=73(width), r13=49(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 236
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 182
LDI r6, 105
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 114
LDI r12, 73
LDI r13, 49
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
