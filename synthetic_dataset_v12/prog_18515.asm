; DESCRIPTION: Composite: Renders a red line between points (245, 95) and (63, 237) then Renders a white disk with center (366, 72) and radius 71 then Sets a single white pixel at (414, 111).
; PLAN: r0=245(x1), r1=95(y1), r2=63(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=72(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x), r11=111(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 95
LDI r2, 63
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 72
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 111
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
