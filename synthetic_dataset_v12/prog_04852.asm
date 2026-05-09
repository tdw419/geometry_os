; DESCRIPTION: Composite: Draws a red circle centered at (151, 77) with radius 59 then Places a yellow line segment connecting (510, 157) to (499, 160) then Sets a single green pixel at (224, 155).
; PLAN: r0=151(x), r1=77(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x1), r6=157(y1), r7=499(x2), r8=160(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=224(x), r11=155(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 77
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 157
LDI r7, 499
LDI r8, 160
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 155
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
