; DESCRIPTION: Composite: Places a orange dot at position (302, 6) then Draws a cyan circle centered at (343, 69) with radius 18 then Draws a yellow line from (263, 148) to (249, 48).
; PLAN: r0=302(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=69(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x1), r11=148(y1), r12=249(x2), r13=48(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 343
LDI r6, 69
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 148
LDI r12, 249
LDI r13, 48
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
