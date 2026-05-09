; DESCRIPTION: Composite: Renders a purple line between points (299, 238) and (394, 27) then Places a yellow 82x46 rectangle at position (390, 131) then Creates a red circular shape at (133, 121) with radius 58.
; PLAN: r0=299(x1), r1=238(y1), r2=394(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=131(y), r7=82(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=121(y), r12=58(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 299
LDI r1, 238
LDI r2, 394
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 131
LDI r7, 82
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 121
LDI r12, 58
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
