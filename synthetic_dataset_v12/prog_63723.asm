; DESCRIPTION: Composite: Places a red line segment connecting (467, 5) to (454, 210) then Creates a red circular shape at (374, 137) with radius 44 then Sets a single orange pixel at (180, 151).
; PLAN: r0=467(x1), r1=5(y1), r2=454(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=137(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x), r11=151(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 467
LDI r1, 5
LDI r2, 454
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 137
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 151
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
