; DESCRIPTION: Composite: Sets a single blue pixel at (193, 211) then Creates a white circular shape at (231, 202) with radius 33 then Draws a red line from (461, 49) to (160, 190).
; PLAN: r0=193(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=202(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=461(x1), r11=49(y1), r12=160(x2), r13=190(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 211
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 202
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 461
LDI r11, 49
LDI r12, 160
LDI r13, 190
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
