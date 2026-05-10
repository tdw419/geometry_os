; DESCRIPTION: Composite: Creates a blue rectangular region at (405, 189) spanning 101 by 66 pixels then Places a purple circle of radius 21 at center (226, 21) then Places a cyan dot at position (452, 141).
; PLAN: r0=405(x), r1=189(y), r2=101(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=21(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=452(x), r11=141(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 189
LDI r2, 101
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 21
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 452
LDI r11, 141
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
