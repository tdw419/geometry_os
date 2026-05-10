; DESCRIPTION: Composite: Sets a single red pixel at (405, 113) then Places a yellow line segment connecting (299, 229) to (336, 199) then Places a orange 20x39 rectangle at position (159, 47).
; PLAN: r0=405(x), r1=113(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=299(x1), r6=229(y1), r7=336(x2), r8=199(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=47(y), r12=20(width), r13=39(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 113
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 229
LDI r7, 336
LDI r8, 199
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 47
LDI r12, 20
LDI r13, 39
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
