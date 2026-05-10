; DESCRIPTION: Composite: Renders a purple disk with center (178, 210) and radius 31 then Renders a magenta box of size 74x19 starting at (17, 105) then Places a green dot at position (51, 229).
; PLAN: r0=178(x), r1=210(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=105(y), r7=74(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=51(x), r11=229(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 210
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 105
LDI r7, 74
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 229
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
