; DESCRIPTION: Composite: Sets a single purple pixel at (294, 101) then Draws a magenta line from (307, 151) to (478, 206) then Creates a magenta rectangular region at (347, 57) spanning 117 by 115 pixels.
; PLAN: r0=294(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=307(x1), r6=151(y1), r7=478(x2), r8=206(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=57(y), r12=117(width), r13=115(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 151
LDI r7, 478
LDI r8, 206
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 57
LDI r12, 117
LDI r13, 115
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
