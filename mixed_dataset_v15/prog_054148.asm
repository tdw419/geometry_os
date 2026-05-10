; DESCRIPTION: Composite: Renders a black line between points (495, 74) and (71, 145) then Places a white dot at position (440, 85) then Renders a black box of size 94x86 starting at (242, 66).
; PLAN: r0=495(x1), r1=74(y1), r2=71(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=85(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=66(y), r12=94(width), r13=86(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 74
LDI r2, 71
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 85
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 242
LDI r11, 66
LDI r12, 94
LDI r13, 86
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
