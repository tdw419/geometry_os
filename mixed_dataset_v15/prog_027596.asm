; DESCRIPTION: Composite: Creates a magenta circular shape at (97, 195) with radius 60 then Places a yellow 49x76 rectangle at position (174, 130) then Sets a single cyan pixel at (0, 208).
; PLAN: r0=97(x), r1=195(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=130(y), r7=49(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=0(x), r11=208(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 195
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 130
LDI r7, 49
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 208
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
