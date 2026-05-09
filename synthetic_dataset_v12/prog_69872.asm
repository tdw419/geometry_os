; DESCRIPTION: Composite: Creates a blue circular shape at (96, 201) with radius 45 then Places a black 82x90 rectangle at position (219, 5) then Places a red dot at position (454, 144).
; PLAN: r0=96(x), r1=201(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=5(y), r7=82(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x), r11=144(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 201
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 5
LDI r7, 82
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 144
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
