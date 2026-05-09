; DESCRIPTION: Composite: Sets a single red pixel at (88, 167) then Renders a blue line between points (20, 147) and (267, 128) then Places a cyan 72x58 rectangle at position (327, 40).
; PLAN: r0=88(x), r1=167(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=147(y1), r7=267(x2), r8=128(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=40(y), r12=72(width), r13=58(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 167
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 20
LDI r6, 147
LDI r7, 267
LDI r8, 128
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 40
LDI r12, 72
LDI r13, 58
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
