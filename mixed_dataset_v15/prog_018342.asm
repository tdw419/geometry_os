; DESCRIPTION: Composite: Draws a green line from (496, 139) to (103, 205) then Places a magenta dot at position (271, 103) then Draws a magenta circle centered at (86, 36) with radius 25.
; PLAN: r0=496(x1), r1=139(y1), r2=103(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=103(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=36(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 496
LDI r1, 139
LDI r2, 103
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 103
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 86
LDI r11, 36
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
