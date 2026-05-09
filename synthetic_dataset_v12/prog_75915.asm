; DESCRIPTION: Composite: Places a orange 64x90 rectangle at position (167, 93) then Sets a single purple pixel at (142, 17) then Renders a green line between points (328, 134) and (455, 165).
; PLAN: r0=167(x), r1=93(y), r2=64(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=17(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=328(x1), r11=134(y1), r12=455(x2), r13=165(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 93
LDI r2, 64
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 17
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 328
LDI r11, 134
LDI r12, 455
LDI r13, 165
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
