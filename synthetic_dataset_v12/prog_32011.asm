; DESCRIPTION: Composite: Places a red 73x110 rectangle at position (320, 13) then Sets a single green pixel at (364, 252) then Creates a red circular shape at (357, 115) with radius 40.
; PLAN: r0=320(x), r1=13(y), r2=73(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=252(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=357(x), r11=115(y), r12=40(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 320
LDI r1, 13
LDI r2, 73
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 252
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 357
LDI r11, 115
LDI r12, 40
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
