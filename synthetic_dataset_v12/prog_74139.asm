; DESCRIPTION: Composite: Draws a green line from (293, 217) to (384, 122) then Draws a purple circle centered at (308, 133) with radius 39 then Places a green dot at position (194, 151).
; PLAN: r0=293(x1), r1=217(y1), r2=384(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=133(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x), r11=151(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 217
LDI r2, 384
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 133
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 151
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
