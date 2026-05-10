; DESCRIPTION: Composite: Sets a single yellow pixel at (83, 66) then Draws a orange circle centered at (184, 107) with radius 80 then Draws a green line from (164, 32) to (78, 47).
; PLAN: r0=83(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=107(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x1), r11=32(y1), r12=78(x2), r13=47(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 184
LDI r6, 107
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 32
LDI r12, 78
LDI r13, 47
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
