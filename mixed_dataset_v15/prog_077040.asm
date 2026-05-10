; DESCRIPTION: Composite: Places a green dot at position (16, 29) then Renders a white line between points (176, 195) and (268, 217) then Places a yellow 99x118 rectangle at position (2, 51).
; PLAN: r0=16(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=176(x1), r6=195(y1), r7=268(x2), r8=217(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=51(y), r12=99(width), r13=118(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 176
LDI r6, 195
LDI r7, 268
LDI r8, 217
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 51
LDI r12, 99
LDI r13, 118
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
