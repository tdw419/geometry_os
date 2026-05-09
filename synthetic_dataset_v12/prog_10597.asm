; DESCRIPTION: Composite: Places a purple dot at position (300, 212) then Renders a red line between points (381, 176) and (238, 146) then Creates a black rectangular region at (228, 3) spanning 29 by 72 pixels.
; PLAN: r0=300(x), r1=212(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=381(x1), r6=176(y1), r7=238(x2), r8=146(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=3(y), r12=29(width), r13=72(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 212
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 176
LDI r7, 238
LDI r8, 146
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 3
LDI r12, 29
LDI r13, 72
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
