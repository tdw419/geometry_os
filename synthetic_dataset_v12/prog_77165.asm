; DESCRIPTION: Composite: Draws a magenta line from (404, 18) to (14, 32) then Sets a single yellow pixel at (259, 91) then Places a green 115x111 rectangle at position (272, 102).
; PLAN: r0=404(x1), r1=18(y1), r2=14(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=91(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=102(y), r12=115(width), r13=111(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 18
LDI r2, 14
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 91
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 272
LDI r11, 102
LDI r12, 115
LDI r13, 111
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
