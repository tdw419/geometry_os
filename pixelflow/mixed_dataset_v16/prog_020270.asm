; DESCRIPTION: Composite: Renders a yellow box of size 66x102 starting at (102, 138) then Sets a single orange pixel at (98, 87) then Renders a orange line between points (302, 231) and (227, 146).
; PLAN: r0=102(x), r1=138(y), r2=66(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=87(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=302(x1), r11=231(y1), r12=227(x2), r13=146(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 138
LDI r2, 66
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 87
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 302
LDI r11, 231
LDI r12, 227
LDI r13, 146
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
