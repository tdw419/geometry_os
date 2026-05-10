; DESCRIPTION: Composite: Creates a magenta circular shape at (110, 76) with radius 72 then Renders a blue box of size 11x47 starting at (398, 106) then Places a white dot at position (339, 152).
; PLAN: r0=110(x), r1=76(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=106(y), r7=11(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x), r11=152(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 76
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 106
LDI r7, 11
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 152
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
