; DESCRIPTION: Composite: Places a magenta 117x36 rectangle at position (162, 59) then Places a yellow dot at position (132, 140) then Places a green line segment connecting (383, 212) to (58, 115).
; PLAN: r0=162(x), r1=59(y), r2=117(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=140(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=383(x1), r11=212(y1), r12=58(x2), r13=115(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 59
LDI r2, 117
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 140
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 383
LDI r11, 212
LDI r12, 58
LDI r13, 115
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
