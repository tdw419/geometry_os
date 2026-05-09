; DESCRIPTION: Composite: Places a white circle of radius 60 at center (209, 128) then Places a orange dot at position (280, 206) then Draws a yellow line from (192, 43) to (431, 160).
; PLAN: r0=209(x), r1=128(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=206(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=192(x1), r11=43(y1), r12=431(x2), r13=160(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 128
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 206
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 192
LDI r11, 43
LDI r12, 431
LDI r13, 160
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
