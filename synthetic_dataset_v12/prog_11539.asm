; DESCRIPTION: Composite: Renders a magenta box of size 40x37 starting at (131, 63) then Sets a single white pixel at (113, 137) then Draws a cyan circle centered at (91, 104) with radius 69.
; PLAN: r0=131(x), r1=63(y), r2=40(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=137(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=91(x), r11=104(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 63
LDI r2, 40
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 137
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 91
LDI r11, 104
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
