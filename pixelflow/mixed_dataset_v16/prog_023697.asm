; DESCRIPTION: Composite: Draws a orange rectangle at (409, 116) with width 60 and height 93 then Sets a single black pixel at (289, 170) then Places a magenta line segment connecting (323, 40) to (195, 121).
; PLAN: r0=409(x), r1=116(y), r2=60(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=323(x1), r11=40(y1), r12=195(x2), r13=121(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 116
LDI r2, 60
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 323
LDI r11, 40
LDI r12, 195
LDI r13, 121
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
