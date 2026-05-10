; DESCRIPTION: Composite: Creates a magenta circular shape at (450, 109) with radius 12 then Places a black line segment connecting (383, 135) to (15, 244) then Sets a single orange pixel at (77, 21).
; PLAN: r0=450(x), r1=109(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x1), r6=135(y1), r7=15(x2), r8=244(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=21(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 109
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 135
LDI r7, 15
LDI r8, 244
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 21
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
