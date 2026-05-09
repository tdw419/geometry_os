; DESCRIPTION: Composite: Places a black line segment connecting (49, 191) to (76, 121) then Draws a purple rectangle at (141, 152) with width 66 and height 55.
; PLAN: r0=49(x1), r1=191(y1), r2=76(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=152(y), r7=66(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 191
LDI r2, 76
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 152
LDI r7, 66
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
