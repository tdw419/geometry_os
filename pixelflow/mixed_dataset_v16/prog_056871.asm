; DESCRIPTION: Composite: Draws a yellow line from (463, 230) to (190, 252) then Places a yellow dot at position (384, 122) then Places a blue 21x83 rectangle at position (130, 82).
; PLAN: r0=463(x1), r1=230(y1), r2=190(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=122(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=130(x), r11=82(y), r12=21(width), r13=83(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 230
LDI r2, 190
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 122
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 130
LDI r11, 82
LDI r12, 21
LDI r13, 83
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
