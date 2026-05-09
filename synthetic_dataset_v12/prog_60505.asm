; DESCRIPTION: Composite: Places a red circle of radius 24 at center (367, 122) then Places a purple dot at position (131, 158) then Places a magenta line segment connecting (108, 36) to (187, 218).
; PLAN: r0=367(x), r1=122(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=158(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=108(x1), r11=36(y1), r12=187(x2), r13=218(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 122
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 158
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 108
LDI r11, 36
LDI r12, 187
LDI r13, 218
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
