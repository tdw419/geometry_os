; DESCRIPTION: Composite: Renders a blue disk with center (247, 200) and radius 36 then Places a purple 23x37 rectangle at position (424, 200).
; PLAN: r0=247(x), r1=200(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=200(y), r7=23(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 200
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 200
LDI r7, 23
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
