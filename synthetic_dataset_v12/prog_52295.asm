; DESCRIPTION: Composite: Draws a orange circle centered at (59, 92) with radius 33 then Places a cyan 50x25 rectangle at position (220, 224) then Sets a single purple pixel at (48, 73).
; PLAN: r0=59(x), r1=92(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=224(y), r7=50(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=48(x), r11=73(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 59
LDI r1, 92
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 224
LDI r7, 50
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 48
LDI r11, 73
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
