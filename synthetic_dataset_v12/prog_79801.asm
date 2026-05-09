; DESCRIPTION: Composite: Creates a purple rectangular region at (382, 111) spanning 75 by 53 pixels then Places a blue dot at position (231, 7) then Places a red circle of radius 17 at center (207, 63).
; PLAN: r0=382(x), r1=111(y), r2=75(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=7(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=207(x), r11=63(y), r12=17(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 111
LDI r2, 75
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 7
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 207
LDI r11, 63
LDI r12, 17
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
