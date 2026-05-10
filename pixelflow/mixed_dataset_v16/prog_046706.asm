; DESCRIPTION: Composite: Renders a magenta box of size 40x46 starting at (329, 205) then Renders a green disk with center (266, 196) and radius 19 then Places a purple dot at position (158, 2).
; PLAN: r0=329(x), r1=205(y), r2=40(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=196(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=2(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 205
LDI r2, 40
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 196
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 2
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
