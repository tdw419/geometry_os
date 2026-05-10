; DESCRIPTION: Composite: Places a yellow line segment connecting (114, 246) to (474, 38) then Places a blue 94x22 rectangle at position (104, 177) then Places a black dot at position (443, 68).
; PLAN: r0=114(x1), r1=246(y1), r2=474(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=177(y), r7=94(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x), r11=68(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 114
LDI r1, 246
LDI r2, 474
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 177
LDI r7, 94
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 68
LDI r12, 0x000000
PSET r10, r11, r12
HALT
