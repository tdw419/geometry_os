; DESCRIPTION: Composite: Places a black line segment connecting (139, 142) to (347, 209) then Places a purple 22x63 rectangle at position (416, 114).
; PLAN: r0=139(x1), r1=142(y1), r2=347(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=114(y), r7=22(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 142
LDI r2, 347
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 114
LDI r7, 22
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
