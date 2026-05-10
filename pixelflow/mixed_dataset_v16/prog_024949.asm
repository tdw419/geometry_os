; DESCRIPTION: Composite: Places a white line segment connecting (214, 12) to (430, 153) then Places a orange 54x18 rectangle at position (255, 222) then Sets a single blue pixel at (64, 59).
; PLAN: r0=214(x1), r1=12(y1), r2=430(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=222(y), r7=54(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x), r11=59(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 12
LDI r2, 430
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 222
LDI r7, 54
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 59
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
