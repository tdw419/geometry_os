; DESCRIPTION: Composite: Places a black circle of radius 62 at center (299, 189) then Places a yellow dot at position (98, 128) then Draws a red line from (68, 254) to (171, 231).
; PLAN: r0=299(x), r1=189(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=128(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=68(x1), r11=254(y1), r12=171(x2), r13=231(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 189
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 128
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 68
LDI r11, 254
LDI r12, 171
LDI r13, 231
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
