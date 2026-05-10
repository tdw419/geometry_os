; DESCRIPTION: Composite: Sets a single yellow pixel at (384, 136) then Places a black 67x75 rectangle at position (230, 129) then Places a yellow line segment connecting (202, 47) to (158, 78).
; PLAN: r0=384(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=129(y), r7=67(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x1), r11=47(y1), r12=158(x2), r13=78(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 136
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 230
LDI r6, 129
LDI r7, 67
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 47
LDI r12, 158
LDI r13, 78
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
