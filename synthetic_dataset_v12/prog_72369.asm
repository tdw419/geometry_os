; DESCRIPTION: Composite: Places a orange dot at position (286, 104) then Draws a orange circle centered at (98, 138) with radius 71 then Draws a cyan line from (31, 43) to (101, 57).
; PLAN: r0=286(x), r1=104(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=138(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x1), r11=43(y1), r12=101(x2), r13=57(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 104
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 98
LDI r6, 138
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 43
LDI r12, 101
LDI r13, 57
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
