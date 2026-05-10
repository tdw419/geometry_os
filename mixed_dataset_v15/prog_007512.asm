; DESCRIPTION: Composite: Places a purple 87x73 rectangle at position (325, 67) then Draws a yellow circle centered at (416, 212) with radius 42 then Places a cyan dot at position (418, 70).
; PLAN: r0=325(x), r1=67(y), r2=87(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=212(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x), r11=70(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 67
LDI r2, 87
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 212
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 70
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
