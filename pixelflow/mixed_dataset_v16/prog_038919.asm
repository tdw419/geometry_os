; DESCRIPTION: Composite: Draws a black circle centered at (183, 114) with radius 63 then Places a white dot at position (117, 73) then Draws a green line from (402, 4) to (231, 126).
; PLAN: r0=183(x), r1=114(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=73(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=4(y1), r12=231(x2), r13=126(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 114
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 73
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 402
LDI r11, 4
LDI r12, 231
LDI r13, 126
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
