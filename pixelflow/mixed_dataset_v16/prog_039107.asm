; DESCRIPTION: Composite: Places a green 11x114 rectangle at position (49, 22) then Sets a single green pixel at (511, 212) then Places a purple line segment connecting (191, 186) to (284, 24).
; PLAN: r0=49(x), r1=22(y), r2=11(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x), r6=212(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=191(x1), r11=186(y1), r12=284(x2), r13=24(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 22
LDI r2, 11
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 212
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 191
LDI r11, 186
LDI r12, 284
LDI r13, 24
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
