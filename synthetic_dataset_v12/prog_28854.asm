; DESCRIPTION: Composite: Places a white dot at position (167, 173) then Places a green line segment connecting (360, 181) to (500, 223) then Draws a red rectangle at (420, 49) with width 66 and height 51.
; PLAN: r0=167(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=360(x1), r6=181(y1), r7=500(x2), r8=223(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=49(y), r12=66(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 173
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 181
LDI r7, 500
LDI r8, 223
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 49
LDI r12, 66
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
