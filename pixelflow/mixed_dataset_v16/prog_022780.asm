; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (80, 105) then Creates a cyan rectangular region at (198, 178) spanning 110 by 68 pixels then Places a purple dot at position (498, 8).
; PLAN: r0=80(x), r1=105(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=178(y), r7=110(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=498(x), r11=8(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 105
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 178
LDI r7, 110
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 8
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
