; DESCRIPTION: Composite: Sets a single purple pixel at (47, 178) then Places a red 63x103 rectangle at position (95, 95) then Renders a black line between points (231, 197) and (479, 196).
; PLAN: r0=47(x), r1=178(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=95(y), r7=63(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x1), r11=197(y1), r12=479(x2), r13=196(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 178
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 95
LDI r7, 63
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 197
LDI r12, 479
LDI r13, 196
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
