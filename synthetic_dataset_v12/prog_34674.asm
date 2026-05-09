; DESCRIPTION: Composite: Creates a white circular shape at (475, 182) with radius 30 then Renders a red line between points (383, 156) and (447, 140) then Sets a single white pixel at (46, 249).
; PLAN: r0=475(x), r1=182(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x1), r6=156(y1), r7=447(x2), r8=140(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=46(x), r11=249(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 475
LDI r1, 182
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 156
LDI r7, 447
LDI r8, 140
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 249
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
