; DESCRIPTION: Composite: Places a red dot at position (385, 10) then Places a orange 41x43 rectangle at position (327, 145) then Creates a white circular shape at (186, 86) with radius 52.
; PLAN: r0=385(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=145(y), r7=41(width), r8=43(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=186(x), r11=86(y), r12=52(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 145
LDI r7, 41
LDI r8, 43
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 86
LDI r12, 52
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
