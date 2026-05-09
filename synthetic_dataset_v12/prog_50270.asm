; DESCRIPTION: Composite: Draws a magenta line from (155, 34) to (53, 80) then Places a white 21x97 rectangle at position (458, 51) then Draws a black circle centered at (443, 161) with radius 61.
; PLAN: r0=155(x1), r1=34(y1), r2=53(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=51(y), r7=21(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x), r11=161(y), r12=61(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 34
LDI r2, 53
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 51
LDI r7, 21
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 161
LDI r12, 61
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
