; DESCRIPTION: Composite: Places a cyan dot at position (94, 103) then Draws a black circle centered at (421, 82) with radius 59 then Places a purple line segment connecting (221, 188) to (484, 93).
; PLAN: r0=94(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=82(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x1), r11=188(y1), r12=484(x2), r13=93(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 421
LDI r6, 82
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 188
LDI r12, 484
LDI r13, 93
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
