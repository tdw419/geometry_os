; DESCRIPTION: Composite: Places a black dot at position (419, 133) then Creates a purple circular shape at (462, 139) with radius 21 then Renders a purple box of size 42x10 starting at (131, 103).
; PLAN: r0=419(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=462(x), r6=139(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=131(x), r11=103(y), r12=42(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 462
LDI r6, 139
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 131
LDI r11, 103
LDI r12, 42
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
