; DESCRIPTION: Composite: Renders a orange disk with center (233, 83) and radius 56 then Places a blue line segment connecting (151, 119) to (189, 197) then Places a yellow dot at position (271, 231).
; PLAN: r0=233(x), r1=83(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x1), r6=119(y1), r7=189(x2), r8=197(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=231(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 233
LDI r1, 83
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 119
LDI r7, 189
LDI r8, 197
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 231
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
