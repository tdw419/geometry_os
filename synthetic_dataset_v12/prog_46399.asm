; DESCRIPTION: Composite: Places a black circle of radius 18 at center (64, 174) then Renders a magenta box of size 46x42 starting at (451, 74) then Places a yellow dot at position (81, 170).
; PLAN: r0=64(x), r1=174(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=74(y), r7=46(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x), r11=170(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 174
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 74
LDI r7, 46
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 170
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
