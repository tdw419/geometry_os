; DESCRIPTION: Composite: Sets a single magenta pixel at (70, 63) then Draws a cyan circle centered at (311, 63) with radius 50 then Places a white line segment connecting (97, 181) to (333, 118).
; PLAN: r0=70(x), r1=63(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=63(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x1), r11=181(y1), r12=333(x2), r13=118(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 63
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 63
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 181
LDI r12, 333
LDI r13, 118
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
