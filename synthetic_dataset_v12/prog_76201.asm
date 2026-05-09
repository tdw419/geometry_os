; DESCRIPTION: Composite: Creates a yellow rectangular region at (384, 48) spanning 108 by 90 pixels then Renders a blue line between points (126, 76) and (361, 207) then Places a purple dot at position (97, 55).
; PLAN: r0=384(x), r1=48(y), r2=108(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=76(y1), r7=361(x2), r8=207(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=55(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 48
LDI r2, 108
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 76
LDI r7, 361
LDI r8, 207
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 55
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
