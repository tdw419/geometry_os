; DESCRIPTION: Composite: Places a purple line segment connecting (233, 108) to (165, 84) then Sets a single magenta pixel at (336, 28) then Places a cyan 48x88 rectangle at position (126, 167).
; PLAN: r0=233(x1), r1=108(y1), r2=165(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=28(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=167(y), r12=48(width), r13=88(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 108
LDI r2, 165
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 28
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 167
LDI r12, 48
LDI r13, 88
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
