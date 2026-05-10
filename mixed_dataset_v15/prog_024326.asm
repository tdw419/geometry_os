; DESCRIPTION: Composite: Places a purple dot at position (49, 108) then Places a purple line segment connecting (252, 74) to (217, 113) then Places a red 44x71 rectangle at position (188, 8).
; PLAN: r0=49(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=74(y1), r7=217(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=8(y), r12=44(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 74
LDI r7, 217
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 8
LDI r12, 44
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
