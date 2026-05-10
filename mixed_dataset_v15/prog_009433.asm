; DESCRIPTION: Composite: Renders a magenta line between points (263, 173) and (310, 134) then Creates a red rectangular region at (276, 114) spanning 10 by 104 pixels then Places a purple dot at position (61, 26).
; PLAN: r0=263(x1), r1=173(y1), r2=310(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=114(y), r7=10(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=26(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 173
LDI r2, 310
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 114
LDI r7, 10
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 26
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
