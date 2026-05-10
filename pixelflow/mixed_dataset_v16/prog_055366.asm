; DESCRIPTION: Composite: Sets a single cyan pixel at (245, 176) then Renders a purple box of size 86x76 starting at (291, 63) then Places a black circle of radius 40 at center (64, 163).
; PLAN: r0=245(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=63(y), r7=86(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x), r11=163(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 63
LDI r7, 86
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 163
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
