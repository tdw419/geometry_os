; DESCRIPTION: Composite: Sets a single black pixel at (247, 139) then Places a yellow 118x64 rectangle at position (121, 58) then Draws a blue line from (331, 198) to (96, 176).
; PLAN: r0=247(x), r1=139(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=58(y), r7=118(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=198(y1), r12=96(x2), r13=176(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 139
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 58
LDI r7, 118
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 198
LDI r12, 96
LDI r13, 176
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
