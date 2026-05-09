; DESCRIPTION: Composite: Renders a magenta line between points (97, 212) and (243, 15) then Places a purple dot at position (481, 202) then Renders a purple box of size 17x104 starting at (186, 43).
; PLAN: r0=97(x1), r1=212(y1), r2=243(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=481(x), r6=202(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=186(x), r11=43(y), r12=17(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 212
LDI r2, 243
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 202
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 186
LDI r11, 43
LDI r12, 17
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
