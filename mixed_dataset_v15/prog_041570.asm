; DESCRIPTION: Composite: Draws a yellow line from (417, 245) to (71, 169) then Creates a black rectangular region at (23, 189) spanning 10 by 59 pixels then Places a red dot at position (258, 208).
; PLAN: r0=417(x1), r1=245(y1), r2=71(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=189(y), r7=10(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=208(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 417
LDI r1, 245
LDI r2, 71
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 189
LDI r7, 10
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 208
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
