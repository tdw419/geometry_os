; DESCRIPTION: Composite: Places a orange dot at position (112, 63) then Places a red line segment connecting (436, 112) to (377, 179) then Places a orange 29x91 rectangle at position (437, 87).
; PLAN: r0=112(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=436(x1), r6=112(y1), r7=377(x2), r8=179(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=87(y), r12=29(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 63
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 436
LDI r6, 112
LDI r7, 377
LDI r8, 179
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 87
LDI r12, 29
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
