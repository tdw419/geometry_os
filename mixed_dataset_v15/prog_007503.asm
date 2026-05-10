; DESCRIPTION: Composite: Creates a green circular shape at (193, 92) with radius 58 then Places a blue 104x88 rectangle at position (251, 105) then Sets a single cyan pixel at (327, 167).
; PLAN: r0=193(x), r1=92(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=105(y), r7=104(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=167(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 92
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 105
LDI r7, 104
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 167
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
