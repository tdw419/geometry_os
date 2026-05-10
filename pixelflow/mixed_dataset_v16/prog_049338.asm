; DESCRIPTION: Composite: Places a cyan dot at position (441, 61) then Places a black 69x59 rectangle at position (162, 141) then Places a purple line segment connecting (465, 160) to (318, 113).
; PLAN: r0=441(x), r1=61(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=141(y), r7=69(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=465(x1), r11=160(y1), r12=318(x2), r13=113(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 61
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 141
LDI r7, 69
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 160
LDI r12, 318
LDI r13, 113
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
