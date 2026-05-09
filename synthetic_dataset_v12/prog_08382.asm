; DESCRIPTION: Composite: Places a black 42x97 rectangle at position (249, 157) then Places a orange dot at position (312, 54) then Renders a white line between points (236, 226) and (184, 141).
; PLAN: r0=249(x), r1=157(y), r2=42(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=236(x1), r11=226(y1), r12=184(x2), r13=141(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 157
LDI r2, 42
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 236
LDI r11, 226
LDI r12, 184
LDI r13, 141
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
