; DESCRIPTION: Composite: Sets a single orange pixel at (308, 123) then Draws a green rectangle at (310, 173) with width 93 and height 80 then Draws a black line from (461, 92) to (299, 73).
; PLAN: r0=308(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=173(y), r7=93(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=461(x1), r11=92(y1), r12=299(x2), r13=73(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 310
LDI r6, 173
LDI r7, 93
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 92
LDI r12, 299
LDI r13, 73
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
