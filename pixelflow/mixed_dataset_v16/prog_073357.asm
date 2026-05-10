; DESCRIPTION: Composite: Places a magenta dot at position (131, 71) then Creates a orange rectangular region at (326, 86) spanning 71 by 51 pixels then Draws a red line from (379, 21) to (310, 115).
; PLAN: r0=131(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=86(y), r7=71(width), r8=51(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x1), r11=21(y1), r12=310(x2), r13=115(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 86
LDI r7, 71
LDI r8, 51
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 21
LDI r12, 310
LDI r13, 115
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
