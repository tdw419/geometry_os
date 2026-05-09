; DESCRIPTION: Composite: Places a yellow dot at position (348, 88) then Draws a purple rectangle at (228, 210) with width 115 and height 27 then Places a orange line segment connecting (404, 46) to (34, 25).
; PLAN: r0=348(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=210(y), r7=115(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=404(x1), r11=46(y1), r12=34(x2), r13=25(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 88
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 228
LDI r6, 210
LDI r7, 115
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 46
LDI r12, 34
LDI r13, 25
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
