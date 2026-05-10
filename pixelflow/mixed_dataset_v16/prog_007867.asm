; DESCRIPTION: Composite: Draws a blue circle centered at (89, 74) with radius 64 then Sets a single white pixel at (208, 31) then Draws a green line from (57, 190) to (467, 116).
; PLAN: r0=89(x), r1=74(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=31(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=57(x1), r11=190(y1), r12=467(x2), r13=116(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 74
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 31
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 57
LDI r11, 190
LDI r12, 467
LDI r13, 116
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
