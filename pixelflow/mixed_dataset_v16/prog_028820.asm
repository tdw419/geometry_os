; DESCRIPTION: Composite: Places a green dot at position (199, 22) then Creates a cyan circular shape at (364, 80) with radius 27 then Places a orange line segment connecting (160, 172) to (280, 231).
; PLAN: r0=199(x), r1=22(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=80(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x1), r11=172(y1), r12=280(x2), r13=231(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 22
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 364
LDI r6, 80
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 172
LDI r12, 280
LDI r13, 231
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
