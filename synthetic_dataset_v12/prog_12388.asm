; DESCRIPTION: Composite: Renders a red box of size 12x76 starting at (138, 26) then Places a purple dot at position (319, 111) then Creates a cyan circular shape at (120, 132) with radius 46.
; PLAN: r0=138(x), r1=26(y), r2=12(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=111(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=120(x), r11=132(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 26
LDI r2, 12
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 111
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 120
LDI r11, 132
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
