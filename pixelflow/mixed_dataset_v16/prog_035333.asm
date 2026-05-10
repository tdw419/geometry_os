; DESCRIPTION: Composite: Renders a yellow disk with center (79, 45) and radius 10 then Places a cyan line segment connecting (224, 9) to (73, 21) then Sets a single green pixel at (351, 92).
; PLAN: r0=79(x), r1=45(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x1), r6=9(y1), r7=73(x2), r8=21(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=92(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 45
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 9
LDI r7, 73
LDI r8, 21
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 92
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
