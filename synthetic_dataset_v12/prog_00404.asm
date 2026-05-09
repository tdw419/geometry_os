; DESCRIPTION: Composite: Creates a black circular shape at (385, 108) with radius 58 then Sets a single yellow pixel at (93, 253) then Draws a yellow line from (479, 160) to (53, 190).
; PLAN: r0=385(x), r1=108(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=253(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=479(x1), r11=160(y1), r12=53(x2), r13=190(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 108
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 253
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 479
LDI r11, 160
LDI r12, 53
LDI r13, 190
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
