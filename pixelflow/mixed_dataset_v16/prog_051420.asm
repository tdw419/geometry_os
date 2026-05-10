; DESCRIPTION: Composite: Creates a green rectangular region at (323, 58) spanning 28 by 82 pixels then Places a black dot at position (333, 109) then Draws a red line from (371, 183) to (12, 39).
; PLAN: r0=323(x), r1=58(y), r2=28(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=109(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=371(x1), r11=183(y1), r12=12(x2), r13=39(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 58
LDI r2, 28
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 109
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 371
LDI r11, 183
LDI r12, 12
LDI r13, 39
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
