; DESCRIPTION: Composite: Draws a cyan circle centered at (393, 200) with radius 36 then Draws a orange line from (31, 138) to (138, 148) then Places a magenta 10x107 rectangle at position (458, 48).
; PLAN: r0=393(x), r1=200(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x1), r6=138(y1), r7=138(x2), r8=148(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=48(y), r12=10(width), r13=107(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 200
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 138
LDI r7, 138
LDI r8, 148
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 48
LDI r12, 10
LDI r13, 107
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
