; DESCRIPTION: Composite: Places a magenta dot at position (358, 133) then Places a magenta line segment connecting (161, 66) to (319, 32) then Renders a blue box of size 57x49 starting at (194, 41).
; PLAN: r0=358(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=161(x1), r6=66(y1), r7=319(x2), r8=32(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=41(y), r12=57(width), r13=49(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 66
LDI r7, 319
LDI r8, 32
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 41
LDI r12, 57
LDI r13, 49
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
