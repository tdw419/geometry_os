; DESCRIPTION: Composite: Renders a magenta line between points (100, 149) and (55, 241) then Places a white dot at position (18, 206) then Places a yellow 88x48 rectangle at position (4, 96).
; PLAN: r0=100(x1), r1=149(y1), r2=55(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=206(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=4(x), r11=96(y), r12=88(width), r13=48(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 149
LDI r2, 55
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 206
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 4
LDI r11, 96
LDI r12, 88
LDI r13, 48
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
