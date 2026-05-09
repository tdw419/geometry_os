; DESCRIPTION: Composite: Draws a blue circle centered at (286, 63) with radius 51 then Places a white 14x19 rectangle at position (185, 124) then Places a red dot at position (364, 61).
; PLAN: r0=286(x), r1=63(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=124(y), r7=14(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x), r11=61(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 63
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 124
LDI r7, 14
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 61
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
