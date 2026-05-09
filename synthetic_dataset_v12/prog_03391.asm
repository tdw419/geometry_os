; DESCRIPTION: Composite: Renders a yellow line between points (9, 129) and (353, 219) then Creates a yellow rectangular region at (149, 129) spanning 72 by 114 pixels then Places a red dot at position (368, 171).
; PLAN: r0=9(x1), r1=129(y1), r2=353(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=129(y), r7=72(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x), r11=171(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 129
LDI r2, 353
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 129
LDI r7, 72
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 171
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
