; DESCRIPTION: Composite: Renders a purple box of size 19x36 starting at (480, 191) then Places a red circle of radius 40 at center (52, 48) then Places a cyan dot at position (255, 109).
; PLAN: r0=480(x), r1=191(y), r2=19(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=48(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=255(x), r11=109(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 191
LDI r2, 19
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 48
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 255
LDI r11, 109
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
