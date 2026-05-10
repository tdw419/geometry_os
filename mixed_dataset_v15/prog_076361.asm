; DESCRIPTION: Composite: Renders a cyan box of size 87x26 starting at (26, 39) then Creates a magenta circular shape at (333, 76) with radius 55 then Places a orange dot at position (247, 149).
; PLAN: r0=26(x), r1=39(y), r2=87(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=76(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x), r11=149(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 39
LDI r2, 87
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 76
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 149
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
