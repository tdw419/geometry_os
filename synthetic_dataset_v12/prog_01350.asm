; DESCRIPTION: Composite: Creates a black rectangular region at (176, 148) spanning 76 by 107 pixels then Renders a yellow line between points (124, 248) and (387, 172) then Places a green dot at position (182, 130).
; PLAN: r0=176(x), r1=148(y), r2=76(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x1), r6=248(y1), r7=387(x2), r8=172(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=130(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 148
LDI r2, 76
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 248
LDI r7, 387
LDI r8, 172
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 130
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
