; DESCRIPTION: Composite: Renders a black box of size 46x61 starting at (9, 1) then Creates a purple circular shape at (236, 59) with radius 34 then Places a cyan dot at position (306, 254).
; PLAN: r0=9(x), r1=1(y), r2=46(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=59(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=254(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 1
LDI r2, 46
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 59
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 254
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
