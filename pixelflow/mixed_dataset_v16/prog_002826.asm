; DESCRIPTION: Composite: Creates a cyan circular shape at (244, 84) with radius 80 then Places a orange dot at position (43, 242) then Creates a blue rectangular region at (335, 152) spanning 48 by 54 pixels.
; PLAN: r0=244(x), r1=84(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=335(x), r11=152(y), r12=48(width), r13=54(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 84
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 335
LDI r11, 152
LDI r12, 48
LDI r13, 54
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
