; DESCRIPTION: Composite: Places a black dot at position (31, 140) then Draws a magenta rectangle at (11, 116) with width 98 and height 81 then Places a red line segment connecting (393, 249) to (470, 50).
; PLAN: r0=31(x), r1=140(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=116(y), r7=98(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x1), r11=249(y1), r12=470(x2), r13=50(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 140
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 11
LDI r6, 116
LDI r7, 98
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 249
LDI r12, 470
LDI r13, 50
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
