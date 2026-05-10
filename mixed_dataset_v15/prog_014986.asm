; DESCRIPTION: Composite: Sets a single cyan pixel at (74, 116) then Creates a purple rectangular region at (380, 161) spanning 59 by 94 pixels then Places a black line segment connecting (428, 148) to (328, 188).
; PLAN: r0=74(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=161(y), r7=59(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x1), r11=148(y1), r12=328(x2), r13=188(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 380
LDI r6, 161
LDI r7, 59
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 148
LDI r12, 328
LDI r13, 188
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
