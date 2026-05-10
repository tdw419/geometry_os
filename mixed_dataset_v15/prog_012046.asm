; DESCRIPTION: Composite: Creates a yellow rectangular region at (349, 161) spanning 28 by 15 pixels then Places a red dot at position (331, 160) then Places a yellow line segment connecting (494, 131) to (182, 87).
; PLAN: r0=349(x), r1=161(y), r2=28(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=160(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=494(x1), r11=131(y1), r12=182(x2), r13=87(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 161
LDI r2, 28
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 160
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 494
LDI r11, 131
LDI r12, 182
LDI r13, 87
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
