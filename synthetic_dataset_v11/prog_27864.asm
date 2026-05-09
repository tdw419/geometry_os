; DESCRIPTION: Composite: . Then Draws a yellow line from (109, 198) to (174, 58). Then Draws a black circle centered at (116, 92) with radius 28.
; PLAN: r0=109(x1), r1=198(y1), r2=174(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=116(x), r1=92(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (109, 198) to (174, 58).
; PLAN: r0=109(x1), r1=198(y1), r2=174(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 198
LDI r2, 174
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (116, 92) with radius 28.
; PLAN: r0=116(x), r1=92(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 92
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
