; DESCRIPTION: Composite: Places a purple 74x73 rectangle at position (127, 104) then Places a black line segment connecting (364, 139) to (416, 57) then Places a green dot at position (308, 96).
; PLAN: r0=127(x), r1=104(y), r2=74(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=139(y1), r7=416(x2), r8=57(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=96(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 127
LDI r1, 104
LDI r2, 74
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 139
LDI r7, 416
LDI r8, 57
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 96
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
