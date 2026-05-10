; DESCRIPTION: Composite: Sets a single blue pixel at (114, 71) then Places a yellow 59x20 rectangle at position (370, 182) then Renders a orange line between points (33, 189) and (335, 205).
; PLAN: r0=114(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=182(y), r7=59(width), r8=20(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=33(x1), r11=189(y1), r12=335(x2), r13=205(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 182
LDI r7, 59
LDI r8, 20
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 189
LDI r12, 335
LDI r13, 205
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
