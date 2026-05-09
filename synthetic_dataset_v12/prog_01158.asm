; DESCRIPTION: Composite: Places a purple circle of radius 35 at center (361, 92) then Creates a blue rectangular region at (102, 16) spanning 26 by 115 pixels then Places a green dot at position (479, 222).
; PLAN: r0=361(x), r1=92(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=16(y), r7=26(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=222(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 92
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 16
LDI r7, 26
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 222
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
