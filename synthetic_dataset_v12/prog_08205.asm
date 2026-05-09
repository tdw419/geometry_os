; DESCRIPTION: Composite: Draws a white line from (506, 0) to (399, 43) then Draws a blue rectangle at (288, 34) with width 64 and height 18 then Places a black dot at position (414, 70).
; PLAN: r0=506(x1), r1=0(y1), r2=399(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=34(y), r7=64(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=70(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 506
LDI r1, 0
LDI r2, 399
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 34
LDI r7, 64
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 70
LDI r12, 0x000000
PSET r10, r11, r12
HALT
