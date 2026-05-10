; DESCRIPTION: Composite: Draws a black line from (276, 46) to (323, 133) then Draws a black circle centered at (346, 44) with radius 34.
; PLAN: r0=276(x1), r1=46(y1), r2=323(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=44(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 276
LDI r1, 46
LDI r2, 323
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 44
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
