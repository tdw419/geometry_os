; DESCRIPTION: Composite: Draws a black rectangle at (105, 64) with width 104 and height 107 then Places a cyan line segment connecting (41, 61) to (94, 125).
; PLAN: r0=105(x), r1=64(y), r2=104(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x1), r6=61(y1), r7=94(x2), r8=125(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 64
LDI r2, 104
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 61
LDI r7, 94
LDI r8, 125
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
