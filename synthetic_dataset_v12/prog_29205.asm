; DESCRIPTION: Composite: Places a green 100x68 rectangle at position (301, 160) then Creates a blue circular shape at (68, 123) with radius 51 then Places a red dot at position (107, 0).
; PLAN: r0=301(x), r1=160(y), r2=100(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=123(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x), r11=0(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 160
LDI r2, 100
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 123
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 0
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
