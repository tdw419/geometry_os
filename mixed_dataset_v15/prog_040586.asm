; DESCRIPTION: Composite: Creates a blue rectangular region at (133, 139) spanning 107 by 47 pixels then Places a purple line segment connecting (420, 129) to (239, 151).
; PLAN: r0=133(x), r1=139(y), r2=107(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=129(y1), r7=239(x2), r8=151(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 139
LDI r2, 107
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 129
LDI r7, 239
LDI r8, 151
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
