; DESCRIPTION: Composite: Sets a single blue pixel at (477, 24) then Renders a orange box of size 112x83 starting at (215, 0) then Creates a magenta circular shape at (371, 124) with radius 25.
; PLAN: r0=477(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=0(y), r7=112(width), r8=83(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=124(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 0
LDI r7, 112
LDI r8, 83
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 124
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
