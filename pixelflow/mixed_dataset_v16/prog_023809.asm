; DESCRIPTION: Composite: Places a blue 65x94 rectangle at position (105, 141) then Places a black dot at position (312, 34) then Renders a green line between points (239, 175) and (393, 192).
; PLAN: r0=105(x), r1=141(y), r2=65(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=34(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=239(x1), r11=175(y1), r12=393(x2), r13=192(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 141
LDI r2, 65
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 34
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 239
LDI r11, 175
LDI r12, 393
LDI r13, 192
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
