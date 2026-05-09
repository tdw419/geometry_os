; DESCRIPTION: Composite: Places a black 12x36 rectangle at position (74, 211) then Renders a purple disk with center (36, 112) and radius 13.
; PLAN: r0=74(x), r1=211(y), r2=12(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=112(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 74
LDI r1, 211
LDI r2, 12
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 112
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
