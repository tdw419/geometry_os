; DESCRIPTION: Composite: Creates a cyan rectangular region at (215, 46) spanning 60 by 104 pixels then Draws a purple circle centered at (479, 223) with radius 30 then Sets a single red pixel at (177, 216).
; PLAN: r0=215(x), r1=46(y), r2=60(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x), r6=223(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x), r11=216(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 46
LDI r2, 60
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 223
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 216
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
