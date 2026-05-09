; DESCRIPTION: Composite: Renders a white disk with center (408, 210) and radius 11 then Renders a yellow box of size 46x64 starting at (195, 13) then Places a cyan dot at position (343, 141).
; PLAN: r0=408(x), r1=210(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=13(y), r7=46(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=141(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 210
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 13
LDI r7, 46
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 141
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
