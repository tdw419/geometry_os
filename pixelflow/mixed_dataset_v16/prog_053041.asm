; DESCRIPTION: Composite: Creates a red circular shape at (81, 131) with radius 36 then Sets a single orange pixel at (372, 50) then Renders a purple box of size 29x104 starting at (14, 22).
; PLAN: r0=81(x), r1=131(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=50(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=14(x), r11=22(y), r12=29(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 131
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 50
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 14
LDI r11, 22
LDI r12, 29
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
