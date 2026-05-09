; DESCRIPTION: Composite: Places a white 46x62 rectangle at position (457, 119) then Places a orange dot at position (370, 41) then Places a black line segment connecting (412, 50) to (327, 240).
; PLAN: r0=457(x), r1=119(y), r2=46(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=41(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=412(x1), r11=50(y1), r12=327(x2), r13=240(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 119
LDI r2, 46
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 41
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 412
LDI r11, 50
LDI r12, 327
LDI r13, 240
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
