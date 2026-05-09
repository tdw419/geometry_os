; DESCRIPTION: Composite: Draws a black line from (385, 224) to (12, 83) then Places a yellow dot at position (406, 245) then Places a white circle of radius 12 at center (152, 46).
; PLAN: r0=385(x1), r1=224(y1), r2=12(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=245(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=46(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 224
LDI r2, 12
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 245
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 152
LDI r11, 46
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
