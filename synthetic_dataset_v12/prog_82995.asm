; DESCRIPTION: Composite: Creates a blue circular shape at (363, 145) with radius 52 then Places a blue dot at position (447, 89) then Places a yellow 114x86 rectangle at position (177, 162).
; PLAN: r0=363(x), r1=145(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=89(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=162(y), r12=114(width), r13=86(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 145
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 89
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 177
LDI r11, 162
LDI r12, 114
LDI r13, 86
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
