; DESCRIPTION: Composite: Draws a yellow circle centered at (97, 27) with radius 26 then Places a yellow dot at position (387, 214) then Places a green line segment connecting (94, 90) to (32, 195).
; PLAN: r0=97(x), r1=27(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=214(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=94(x1), r11=90(y1), r12=32(x2), r13=195(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 27
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 214
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 94
LDI r11, 90
LDI r12, 32
LDI r13, 195
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
