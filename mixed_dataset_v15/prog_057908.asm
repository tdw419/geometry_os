; DESCRIPTION: Composite: Places a green line segment connecting (203, 16) to (418, 43) then Places a green circle of radius 59 at center (151, 70) then Places a blue dot at position (386, 160).
; PLAN: r0=203(x1), r1=16(y1), r2=418(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=70(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=160(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 16
LDI r2, 418
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 70
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 160
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
