; DESCRIPTION: Composite: Creates a magenta rectangular region at (32, 140) spanning 50 by 58 pixels then Draws a purple circle centered at (21, 190) with radius 16 then Places a yellow dot at position (350, 71).
; PLAN: r0=32(x), r1=140(y), r2=50(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=190(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=350(x), r11=71(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 32
LDI r1, 140
LDI r2, 50
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 190
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 350
LDI r11, 71
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
