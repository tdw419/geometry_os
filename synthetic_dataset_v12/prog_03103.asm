; DESCRIPTION: Composite: Places a purple 34x96 rectangle at position (108, 104) then Places a orange line segment connecting (51, 81) to (460, 20).
; PLAN: r0=108(x), r1=104(y), r2=34(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x1), r6=81(y1), r7=460(x2), r8=20(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 104
LDI r2, 34
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 81
LDI r7, 460
LDI r8, 20
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
