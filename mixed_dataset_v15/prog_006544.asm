; DESCRIPTION: Composite: Sets a single green pixel at (244, 92) then Draws a green circle centered at (92, 172) with radius 64 then Draws a green line from (87, 236) to (292, 170).
; PLAN: r0=244(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=172(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x1), r11=236(y1), r12=292(x2), r13=170(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 92
LDI r6, 172
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 236
LDI r12, 292
LDI r13, 170
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
