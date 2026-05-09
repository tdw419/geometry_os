; DESCRIPTION: Composite: Sets a single red pixel at (112, 83) then Places a black 90x87 rectangle at position (10, 15) then Renders a orange line between points (83, 212) and (403, 223).
; PLAN: r0=112(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=15(y), r7=90(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x1), r11=212(y1), r12=403(x2), r13=223(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 10
LDI r6, 15
LDI r7, 90
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 212
LDI r12, 403
LDI r13, 223
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
