; DESCRIPTION: Composite: Places a magenta dot at position (231, 173) then Creates a yellow rectangular region at (121, 205) spanning 58 by 21 pixels then Places a green line segment connecting (378, 71) to (345, 51).
; PLAN: r0=231(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=205(y), r7=58(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=71(y1), r12=345(x2), r13=51(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 173
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 205
LDI r7, 58
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 71
LDI r12, 345
LDI r13, 51
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
