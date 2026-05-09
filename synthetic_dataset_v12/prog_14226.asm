; DESCRIPTION: Composite: Draws a purple circle centered at (295, 151) with radius 35 then Renders a blue box of size 84x19 starting at (95, 201) then Sets a single magenta pixel at (408, 215).
; PLAN: r0=295(x), r1=151(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=201(y), r7=84(width), r8=19(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=215(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 151
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 201
LDI r7, 84
LDI r8, 19
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 215
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
