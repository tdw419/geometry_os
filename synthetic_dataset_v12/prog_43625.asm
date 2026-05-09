; DESCRIPTION: Composite: Draws a black line from (167, 125) to (481, 123) then Places a black circle of radius 78 at center (372, 104).
; PLAN: r0=167(x1), r1=125(y1), r2=481(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=104(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 125
LDI r2, 481
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 104
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
