; DESCRIPTION: Composite: Places a red dot at position (305, 106) then Creates a red rectangular region at (343, 134) spanning 26 by 20 pixels then Renders a black line between points (210, 28) and (405, 197).
; PLAN: r0=305(x), r1=106(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=134(y), r7=26(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x1), r11=28(y1), r12=405(x2), r13=197(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 106
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 343
LDI r6, 134
LDI r7, 26
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 28
LDI r12, 405
LDI r13, 197
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
