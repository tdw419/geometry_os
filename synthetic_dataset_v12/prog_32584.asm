; DESCRIPTION: Composite: Draws a yellow circle centered at (278, 38) with radius 23 then Draws a blue rectangle at (242, 38) with width 66 and height 81 then Sets a single orange pixel at (242, 229).
; PLAN: r0=278(x), r1=38(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x), r6=38(y), r7=66(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x), r11=229(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 38
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 38
LDI r7, 66
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 229
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
