; DESCRIPTION: Composite: Renders a black line between points (219, 145) and (181, 22) then Renders a white box of size 112x74 starting at (128, 66) then Places a red dot at position (310, 164).
; PLAN: r0=219(x1), r1=145(y1), r2=181(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=66(y), r7=112(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x), r11=164(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 145
LDI r2, 181
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 66
LDI r7, 112
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 164
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
