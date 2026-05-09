; DESCRIPTION: Composite: Renders a magenta box of size 87x104 starting at (367, 149) then Draws a cyan circle centered at (163, 167) with radius 22 then Sets a single orange pixel at (481, 64).
; PLAN: r0=367(x), r1=149(y), r2=87(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=167(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=481(x), r11=64(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 367
LDI r1, 149
LDI r2, 87
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 167
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 481
LDI r11, 64
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
