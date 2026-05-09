; DESCRIPTION: Composite: Places a cyan line segment connecting (455, 253) to (47, 147) then Creates a purple rectangular region at (332, 167) spanning 67 by 41 pixels.
; PLAN: r0=455(x1), r1=253(y1), r2=47(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=167(y), r7=67(width), r8=41(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 253
LDI r2, 47
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 167
LDI r7, 67
LDI r8, 41
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
