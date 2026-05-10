; DESCRIPTION: Composite: Places a white line segment connecting (291, 38) to (443, 110) then Places a magenta dot at position (134, 142) then Draws a red rectangle at (43, 32) with width 32 and height 93.
; PLAN: r0=291(x1), r1=38(y1), r2=443(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=142(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=43(x), r11=32(y), r12=32(width), r13=93(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 38
LDI r2, 443
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 142
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 32
LDI r12, 32
LDI r13, 93
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
