; DESCRIPTION: Composite: Draws a purple circle centered at (76, 139) with radius 46 then Places a red 62x69 rectangle at position (8, 54) then Places a cyan dot at position (82, 52).
; PLAN: r0=76(x), r1=139(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=54(y), r7=62(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x), r11=52(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 139
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 54
LDI r7, 62
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 52
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
