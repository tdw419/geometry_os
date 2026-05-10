; DESCRIPTION: Composite: Sets a single blue pixel at (380, 70) then Creates a cyan circular shape at (388, 82) with radius 30 then Renders a red line between points (460, 155) and (338, 219).
; PLAN: r0=380(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=82(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x1), r11=155(y1), r12=338(x2), r13=219(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 82
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 155
LDI r12, 338
LDI r13, 219
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
