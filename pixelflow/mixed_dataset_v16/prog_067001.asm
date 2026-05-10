; DESCRIPTION: Composite: Draws a purple circle centered at (301, 58) with radius 56 then Renders a cyan box of size 96x58 starting at (100, 58) then Sets a single magenta pixel at (309, 102).
; PLAN: r0=301(x), r1=58(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=58(y), r7=96(width), r8=58(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=102(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 58
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 58
LDI r7, 96
LDI r8, 58
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 102
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
