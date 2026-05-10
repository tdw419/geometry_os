; DESCRIPTION: Composite: Renders a white line between points (461, 105) and (197, 165) then Places a black dot at position (191, 211) then Renders a black box of size 70x58 starting at (256, 66).
; PLAN: r0=461(x1), r1=105(y1), r2=197(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=211(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=256(x), r11=66(y), r12=70(width), r13=58(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 105
LDI r2, 197
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 211
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 256
LDI r11, 66
LDI r12, 70
LDI r13, 58
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
