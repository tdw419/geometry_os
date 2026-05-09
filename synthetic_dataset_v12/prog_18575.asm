; DESCRIPTION: Composite: Draws a green line from (39, 83) to (281, 218) then Creates a white rectangular region at (109, 176) spanning 111 by 80 pixels then Places a yellow dot at position (76, 22).
; PLAN: r0=39(x1), r1=83(y1), r2=281(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=176(y), r7=111(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=22(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 83
LDI r2, 281
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 176
LDI r7, 111
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 22
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
