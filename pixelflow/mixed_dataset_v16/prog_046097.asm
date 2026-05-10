; DESCRIPTION: Composite: Places a red circle of radius 27 at center (424, 38) then Places a black 96x37 rectangle at position (27, 192) then Places a red dot at position (264, 127).
; PLAN: r0=424(x), r1=38(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=192(y), r7=96(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=264(x), r11=127(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 38
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 192
LDI r7, 96
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 127
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
