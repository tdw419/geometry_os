; DESCRIPTION: Composite: Places a magenta circle of radius 46 at center (353, 127) then Places a black 70x28 rectangle at position (82, 26) then Places a yellow dot at position (260, 49).
; PLAN: r0=353(x), r1=127(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=26(y), r7=70(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=49(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 127
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 26
LDI r7, 70
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 49
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
