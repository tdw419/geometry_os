; DESCRIPTION: Composite: Sets a single magenta pixel at (508, 231) then Draws a black circle centered at (75, 153) with radius 22 then Places a green 106x58 rectangle at position (82, 0).
; PLAN: r0=508(x), r1=231(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=153(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=0(y), r12=106(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 231
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 153
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 0
LDI r12, 106
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
