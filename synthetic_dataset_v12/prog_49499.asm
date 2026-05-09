; DESCRIPTION: Composite: Places a black 102x117 rectangle at position (169, 138) then Sets a single white pixel at (201, 53) then Renders a red line between points (277, 161) and (468, 27).
; PLAN: r0=169(x), r1=138(y), r2=102(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=53(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=277(x1), r11=161(y1), r12=468(x2), r13=27(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 138
LDI r2, 102
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 53
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 277
LDI r11, 161
LDI r12, 468
LDI r13, 27
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
