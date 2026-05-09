; DESCRIPTION: Composite: Creates a green circular shape at (269, 136) with radius 26 then Renders a purple box of size 11x38 starting at (377, 121) then Sets a single magenta pixel at (343, 161).
; PLAN: r0=269(x), r1=136(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=121(y), r7=11(width), r8=38(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=161(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 136
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 121
LDI r7, 11
LDI r8, 38
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 161
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
