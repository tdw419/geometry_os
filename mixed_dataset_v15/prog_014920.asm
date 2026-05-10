; DESCRIPTION: Composite: Places a purple 87x86 rectangle at position (394, 5) then Draws a blue circle centered at (415, 162) with radius 25 then Places a purple dot at position (489, 145).
; PLAN: r0=394(x), r1=5(y), r2=87(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=162(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x), r11=145(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 5
LDI r2, 87
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 162
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 145
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
