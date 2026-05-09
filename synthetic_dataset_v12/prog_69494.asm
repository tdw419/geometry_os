; DESCRIPTION: Composite: Sets a single purple pixel at (461, 94) then Creates a orange rectangular region at (449, 117) spanning 12 by 32 pixels then Draws a yellow line from (88, 69) to (191, 249).
; PLAN: r0=461(x), r1=94(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=449(x), r6=117(y), r7=12(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x1), r11=69(y1), r12=191(x2), r13=249(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 94
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 449
LDI r6, 117
LDI r7, 12
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 69
LDI r12, 191
LDI r13, 249
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
