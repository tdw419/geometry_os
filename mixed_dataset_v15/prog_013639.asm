; DESCRIPTION: Composite: Draws a cyan circle centered at (216, 187) with radius 58 then Places a purple dot at position (428, 224) then Renders a yellow line between points (381, 38) and (430, 130).
; PLAN: r0=216(x), r1=187(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=224(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=381(x1), r11=38(y1), r12=430(x2), r13=130(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 187
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 224
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 381
LDI r11, 38
LDI r12, 430
LDI r13, 130
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
