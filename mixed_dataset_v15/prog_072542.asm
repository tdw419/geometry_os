; DESCRIPTION: Composite: Sets a single black pixel at (107, 155) then Places a magenta 14x21 rectangle at position (263, 87) then Renders a blue line between points (227, 209) and (368, 216).
; PLAN: r0=107(x), r1=155(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=87(y), r7=14(width), r8=21(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x1), r11=209(y1), r12=368(x2), r13=216(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 155
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 263
LDI r6, 87
LDI r7, 14
LDI r8, 21
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 209
LDI r12, 368
LDI r13, 216
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
