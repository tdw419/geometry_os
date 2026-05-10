; DESCRIPTION: Composite: Renders a blue disk with center (410, 143) and radius 57 then Places a purple 17x60 rectangle at position (376, 125) then Sets a single black pixel at (175, 89).
; PLAN: r0=410(x), r1=143(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=125(y), r7=17(width), r8=60(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=89(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 143
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 125
LDI r7, 17
LDI r8, 60
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 89
LDI r12, 0x000000
PSET r10, r11, r12
HALT
