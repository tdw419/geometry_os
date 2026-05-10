; DESCRIPTION: Composite: Renders a yellow disk with center (362, 18) and radius 14 then Places a purple 29x62 rectangle at position (476, 89).
; PLAN: r0=362(x), r1=18(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=89(y), r7=29(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 18
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 89
LDI r7, 29
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
