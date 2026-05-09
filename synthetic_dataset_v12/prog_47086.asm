; DESCRIPTION: Composite: Renders a orange disk with center (464, 29) and radius 16 then Creates a purple rectangular region at (273, 99) spanning 81 by 108 pixels then Places a purple dot at position (236, 236).
; PLAN: r0=464(x), r1=29(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=99(y), r7=81(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x), r11=236(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 464
LDI r1, 29
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 99
LDI r7, 81
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 236
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
