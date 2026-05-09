; DESCRIPTION: Composite: Places a black 119x23 rectangle at position (42, 150) then Places a yellow dot at position (149, 141) then Draws a red line from (394, 77) to (428, 45).
; PLAN: r0=42(x), r1=150(y), r2=119(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=394(x1), r11=77(y1), r12=428(x2), r13=45(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 150
LDI r2, 119
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 394
LDI r11, 77
LDI r12, 428
LDI r13, 45
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
