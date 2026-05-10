; DESCRIPTION: Composite: Creates a white circular shape at (383, 97) with radius 51 then Draws a red line from (326, 107) to (373, 194).
; PLAN: r0=383(x), r1=97(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x1), r6=107(y1), r7=373(x2), r8=194(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 97
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 107
LDI r7, 373
LDI r8, 194
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
