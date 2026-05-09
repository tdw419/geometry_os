; DESCRIPTION: Composite: Places a magenta circle of radius 58 at center (91, 98) then Renders a black box of size 81x102 starting at (163, 27) then Places a green dot at position (302, 135).
; PLAN: r0=91(x), r1=98(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=27(y), r7=81(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x), r11=135(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 98
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 27
LDI r7, 81
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 135
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
