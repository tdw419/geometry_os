; DESCRIPTION: Composite: Renders a yellow disk with center (160, 224) and radius 30 then Places a red dot at position (326, 91) then Renders a green line between points (104, 128) and (304, 106).
; PLAN: r0=160(x), r1=224(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=91(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=104(x1), r11=128(y1), r12=304(x2), r13=106(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 224
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 91
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 104
LDI r11, 128
LDI r12, 304
LDI r13, 106
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
