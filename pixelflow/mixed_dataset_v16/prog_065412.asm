; DESCRIPTION: Composite: Sets a single red pixel at (477, 19) then Renders a purple box of size 24x95 starting at (109, 26) then Draws a magenta line from (162, 218) to (19, 113).
; PLAN: r0=477(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=26(y), r7=24(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=218(y1), r12=19(x2), r13=113(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 109
LDI r6, 26
LDI r7, 24
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 218
LDI r12, 19
LDI r13, 113
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
