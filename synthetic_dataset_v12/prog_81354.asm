; DESCRIPTION: Composite: Places a black dot at position (265, 238) then Renders a yellow line between points (497, 33) and (437, 11) then Creates a blue rectangular region at (425, 54) spanning 60 by 85 pixels.
; PLAN: r0=265(x), r1=238(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=33(y1), r7=437(x2), r8=11(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=54(y), r12=60(width), r13=85(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 238
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 497
LDI r6, 33
LDI r7, 437
LDI r8, 11
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 54
LDI r12, 60
LDI r13, 85
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
