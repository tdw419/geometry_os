; DESCRIPTION: Composite: Sets a single black pixel at (142, 212) then Renders a purple disk with center (365, 116) and radius 74 then Places a purple 104x73 rectangle at position (279, 123).
; PLAN: r0=142(x), r1=212(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=116(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=123(y), r12=104(width), r13=73(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 212
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 116
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 123
LDI r12, 104
LDI r13, 73
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
