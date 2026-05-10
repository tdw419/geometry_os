; DESCRIPTION: Composite: Renders a blue disk with center (405, 149) and radius 71 then Places a blue 105x37 rectangle at position (364, 151) then Sets a single red pixel at (390, 56).
; PLAN: r0=405(x), r1=149(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=151(y), r7=105(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=56(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 149
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 151
LDI r7, 105
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 56
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
