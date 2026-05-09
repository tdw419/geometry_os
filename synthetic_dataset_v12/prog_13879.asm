; DESCRIPTION: Composite: Renders a black line between points (202, 71) and (26, 100) then Places a orange dot at position (158, 236) then Places a cyan 107x116 rectangle at position (396, 61).
; PLAN: r0=202(x1), r1=71(y1), r2=26(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=236(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=61(y), r12=107(width), r13=116(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 71
LDI r2, 26
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 236
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 396
LDI r11, 61
LDI r12, 107
LDI r13, 116
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
