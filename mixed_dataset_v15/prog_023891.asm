; DESCRIPTION: Composite: Places a orange line segment connecting (415, 187) to (394, 122) then Draws a blue circle centered at (380, 167) with radius 19.
; PLAN: r0=415(x1), r1=187(y1), r2=394(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=167(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 187
LDI r2, 394
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 167
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
