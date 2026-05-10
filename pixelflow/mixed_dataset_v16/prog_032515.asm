; DESCRIPTION: Composite: Places a cyan dot at position (438, 1) then Renders a red line between points (86, 110) and (169, 197) then Creates a magenta rectangular region at (104, 103) spanning 47 by 71 pixels.
; PLAN: r0=438(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=110(y1), r7=169(x2), r8=197(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=103(y), r12=47(width), r13=71(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 110
LDI r7, 169
LDI r8, 197
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 103
LDI r12, 47
LDI r13, 71
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
