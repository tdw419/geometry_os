; DESCRIPTION: Composite: Draws a black rectangle at (95, 72) with width 92 and height 41 then Places a white line segment connecting (349, 16) to (329, 226).
; PLAN: r0=95(x), r1=72(y), r2=92(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=16(y1), r7=329(x2), r8=226(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 72
LDI r2, 92
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 16
LDI r7, 329
LDI r8, 226
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
