; DESCRIPTION: Composite: Renders a cyan box of size 86x64 starting at (164, 78) then Draws a black circle centered at (245, 167) with radius 79.
; PLAN: r0=164(x), r1=78(y), r2=86(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=167(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 164
LDI r1, 78
LDI r2, 86
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 167
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
