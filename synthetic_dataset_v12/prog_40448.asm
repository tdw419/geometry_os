; DESCRIPTION: Composite: Places a purple 22x112 rectangle at position (148, 50) then Sets a single orange pixel at (449, 109) then Draws a yellow line from (510, 43) to (241, 223).
; PLAN: r0=148(x), r1=50(y), r2=22(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=109(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=510(x1), r11=43(y1), r12=241(x2), r13=223(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 50
LDI r2, 22
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 109
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 510
LDI r11, 43
LDI r12, 241
LDI r13, 223
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
