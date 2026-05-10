; DESCRIPTION: Composite: Places a yellow dot at position (232, 149) then Creates a magenta rectangular region at (321, 42) spanning 26 by 42 pixels then Renders a magenta line between points (131, 249) and (93, 187).
; PLAN: r0=232(x), r1=149(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=42(y), r7=26(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=131(x1), r11=249(y1), r12=93(x2), r13=187(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 149
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 321
LDI r6, 42
LDI r7, 26
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 249
LDI r12, 93
LDI r13, 187
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
