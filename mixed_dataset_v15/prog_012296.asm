; DESCRIPTION: Composite: Renders a cyan box of size 106x18 starting at (219, 32) then Creates a magenta circular shape at (233, 79) with radius 39 then Places a red dot at position (147, 70).
; PLAN: r0=219(x), r1=32(y), r2=106(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=79(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x), r11=70(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 32
LDI r2, 106
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 79
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 70
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
