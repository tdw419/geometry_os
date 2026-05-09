; DESCRIPTION: Composite: Sets a single cyan pixel at (404, 75) then Renders a cyan disk with center (325, 61) and radius 55 then Renders a purple line between points (354, 25) and (167, 2).
; PLAN: r0=404(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=61(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x1), r11=25(y1), r12=167(x2), r13=2(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 61
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 25
LDI r12, 167
LDI r13, 2
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
