; DESCRIPTION: Composite: Sets a single purple pixel at (164, 233) then Places a cyan 90x84 rectangle at position (106, 6) then Draws a yellow circle centered at (53, 155) with radius 35.
; PLAN: r0=164(x), r1=233(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=6(y), r7=90(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x), r11=155(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 233
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 6
LDI r7, 90
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 155
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
