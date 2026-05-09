; DESCRIPTION: Composite: Places a magenta line segment connecting (466, 63) to (349, 238) then Places a white dot at position (312, 93) then Creates a red rectangular region at (63, 91) spanning 23 by 59 pixels.
; PLAN: r0=466(x1), r1=63(y1), r2=349(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=93(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=63(x), r11=91(y), r12=23(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 63
LDI r2, 349
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 93
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 63
LDI r11, 91
LDI r12, 23
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
