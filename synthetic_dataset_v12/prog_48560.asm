; DESCRIPTION: Composite: Places a green 66x78 rectangle at position (27, 47) then Sets a single black pixel at (44, 97) then Places a white line segment connecting (151, 107) to (437, 130).
; PLAN: r0=27(x), r1=47(y), r2=66(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=97(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=151(x1), r11=107(y1), r12=437(x2), r13=130(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 47
LDI r2, 66
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 97
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 151
LDI r11, 107
LDI r12, 437
LDI r13, 130
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
