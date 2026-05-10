; DESCRIPTION: Composite: Places a black dot at position (456, 97) then Places a yellow line segment connecting (141, 4) to (470, 221) then Creates a white rectangular region at (32, 83) spanning 50 by 14 pixels.
; PLAN: r0=456(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=141(x1), r6=4(y1), r7=470(x2), r8=221(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=83(y), r12=50(width), r13=14(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 141
LDI r6, 4
LDI r7, 470
LDI r8, 221
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 83
LDI r12, 50
LDI r13, 14
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
