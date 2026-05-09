; DESCRIPTION: Composite: Draws a blue rectangle at (82, 86) with width 61 and height 59 then Places a purple circle of radius 72 at center (368, 107) then Sets a single white pixel at (444, 134).
; PLAN: r0=82(x), r1=86(y), r2=61(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=107(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=444(x), r11=134(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 86
LDI r2, 61
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 107
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 444
LDI r11, 134
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
