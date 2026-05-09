; DESCRIPTION: Composite: Places a magenta dot at position (117, 65) then Places a yellow 53x80 rectangle at position (262, 140) then Draws a purple circle centered at (142, 117) with radius 64.
; PLAN: r0=117(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=140(y), r7=53(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x), r11=117(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 140
LDI r7, 53
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 117
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
