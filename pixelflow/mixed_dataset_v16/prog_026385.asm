; DESCRIPTION: Composite: Places a red dot at position (263, 91) then Creates a green rectangular region at (215, 151) spanning 35 by 55 pixels then Draws a black line from (12, 23) to (127, 67).
; PLAN: r0=263(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=151(y), r7=35(width), r8=55(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=12(x1), r11=23(y1), r12=127(x2), r13=67(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 91
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 215
LDI r6, 151
LDI r7, 35
LDI r8, 55
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 23
LDI r12, 127
LDI r13, 67
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
