; DESCRIPTION: Composite: Draws a red line from (408, 188) to (321, 103) then Places a green dot at position (239, 152) then Places a green 40x37 rectangle at position (452, 58).
; PLAN: r0=408(x1), r1=188(y1), r2=321(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=152(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=452(x), r11=58(y), r12=40(width), r13=37(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 188
LDI r2, 321
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 152
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 452
LDI r11, 58
LDI r12, 40
LDI r13, 37
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
