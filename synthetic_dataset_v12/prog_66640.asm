; DESCRIPTION: Composite: Renders a green box of size 107x57 starting at (247, 57) then Creates a white circular shape at (340, 215) with radius 16 then Places a purple dot at position (451, 67).
; PLAN: r0=247(x), r1=57(y), r2=107(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x), r6=215(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x), r11=67(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 57
LDI r2, 107
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 215
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 67
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
