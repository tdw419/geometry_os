; DESCRIPTION: Composite: Sets a single red pixel at (61, 156) then Places a cyan 72x14 rectangle at position (268, 2) then Places a cyan line segment connecting (211, 248) to (407, 169).
; PLAN: r0=61(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=2(y), r7=72(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x1), r11=248(y1), r12=407(x2), r13=169(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 2
LDI r7, 72
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 248
LDI r12, 407
LDI r13, 169
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
