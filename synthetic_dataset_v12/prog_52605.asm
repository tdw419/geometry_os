; DESCRIPTION: Composite: Places a yellow line segment connecting (179, 148) to (203, 136) then Places a cyan dot at position (467, 97).
; PLAN: r0=179(x1), r1=148(y1), r2=203(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=97(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 148
LDI r2, 203
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 97
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
