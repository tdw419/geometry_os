; DESCRIPTION: Composite: Places a magenta circle of radius 76 at center (231, 151) then Sets a single purple pixel at (126, 8) then Draws a red line from (152, 55) to (423, 168).
; PLAN: r0=231(x), r1=151(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=8(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=152(x1), r11=55(y1), r12=423(x2), r13=168(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 151
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 8
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 152
LDI r11, 55
LDI r12, 423
LDI r13, 168
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
