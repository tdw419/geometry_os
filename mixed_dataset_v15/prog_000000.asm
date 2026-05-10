; DESCRIPTION: Composite: Places a cyan dot at position (234, 16) then Draws a orange rectangle at (182, 102) with width 89 and height 106 then Creates a purple circular shape at (32, 67) with radius 10.
; PLAN: r0=234(x), r1=16(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=102(y), r7=89(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x), r11=67(y), r12=10(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 16
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 182
LDI r6, 102
LDI r7, 89
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 67
LDI r12, 10
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
