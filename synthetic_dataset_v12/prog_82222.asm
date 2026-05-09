; DESCRIPTION: Composite: Places a green 73x98 rectangle at position (161, 141) then Places a yellow dot at position (485, 149) then Creates a purple circular shape at (87, 115) with radius 46.
; PLAN: r0=161(x), r1=141(y), r2=73(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=149(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=115(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 141
LDI r2, 73
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 149
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 87
LDI r11, 115
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
