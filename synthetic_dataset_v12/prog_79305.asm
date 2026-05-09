; DESCRIPTION: Composite: Places a blue 111x44 rectangle at position (215, 83) then Draws a purple circle centered at (253, 162) with radius 33 then Sets a single orange pixel at (50, 117).
; PLAN: r0=215(x), r1=83(y), r2=111(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=162(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=50(x), r11=117(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 83
LDI r2, 111
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 162
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 50
LDI r11, 117
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
