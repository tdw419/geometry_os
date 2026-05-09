; DESCRIPTION: Composite: Creates a cyan circular shape at (27, 158) with radius 24 then Places a black 40x107 rectangle at position (257, 141) then Draws a blue line from (185, 12) to (345, 51).
; PLAN: r0=27(x), r1=158(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=141(y), r7=40(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=185(x1), r11=12(y1), r12=345(x2), r13=51(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 158
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 141
LDI r7, 40
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 12
LDI r12, 345
LDI r13, 51
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
