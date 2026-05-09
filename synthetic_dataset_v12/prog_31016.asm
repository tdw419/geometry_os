; DESCRIPTION: Composite: Draws a orange line from (23, 107) to (142, 34) then Sets a single black pixel at (373, 213).
; PLAN: r0=23(x1), r1=107(y1), r2=142(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=213(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 107
LDI r2, 142
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 213
LDI r7, 0x000000
PSET r5, r6, r7
HALT
