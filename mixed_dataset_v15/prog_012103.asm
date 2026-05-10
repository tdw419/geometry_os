; DESCRIPTION: Composite: Places a yellow line segment connecting (172, 224) to (350, 255) then Places a yellow dot at position (480, 51).
; PLAN: r0=172(x1), r1=224(y1), r2=350(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=51(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 224
LDI r2, 350
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 51
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
