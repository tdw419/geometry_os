; DESCRIPTION: Composite: Places a black circle of radius 67 at center (424, 99) then Draws a cyan rectangle at (374, 215) with width 115 and height 32 then Sets a single white pixel at (28, 6).
; PLAN: r0=424(x), r1=99(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=215(y), r7=115(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x), r11=6(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 99
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 215
LDI r7, 115
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 6
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
