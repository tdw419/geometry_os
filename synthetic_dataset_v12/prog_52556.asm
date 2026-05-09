; DESCRIPTION: Composite: Places a black line segment connecting (289, 245) to (491, 51) then Places a yellow dot at position (231, 46) then Places a white 118x117 rectangle at position (128, 32).
; PLAN: r0=289(x1), r1=245(y1), r2=491(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=46(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=32(y), r12=118(width), r13=117(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 245
LDI r2, 491
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 46
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 128
LDI r11, 32
LDI r12, 118
LDI r13, 117
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
