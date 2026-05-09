; DESCRIPTION: Composite: Creates a yellow rectangular region at (95, 171) spanning 61 by 72 pixels then Places a purple dot at position (37, 228) then Creates a cyan circular shape at (114, 88) with radius 79.
; PLAN: r0=95(x), r1=171(y), r2=61(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=228(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=88(y), r12=79(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 171
LDI r2, 61
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 228
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 114
LDI r11, 88
LDI r12, 79
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
