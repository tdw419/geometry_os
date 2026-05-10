; DESCRIPTION: Composite: Sets a single yellow pixel at (306, 246) then Renders a magenta line between points (297, 165) and (25, 6) then Renders a yellow box of size 25x94 starting at (324, 27).
; PLAN: r0=306(x), r1=246(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=297(x1), r6=165(y1), r7=25(x2), r8=6(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=27(y), r12=25(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 246
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 165
LDI r7, 25
LDI r8, 6
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 27
LDI r12, 25
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
