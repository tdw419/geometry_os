; DESCRIPTION: Composite: Places a red dot at position (387, 188) then Draws a black circle centered at (196, 123) with radius 54 then Renders a purple box of size 73x105 starting at (437, 23).
; PLAN: r0=387(x), r1=188(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=123(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x), r11=23(y), r12=73(width), r13=105(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 188
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 196
LDI r6, 123
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 23
LDI r12, 73
LDI r13, 105
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
