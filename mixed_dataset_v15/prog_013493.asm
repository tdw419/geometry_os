; DESCRIPTION: Composite: Creates a orange rectangular region at (66, 73) spanning 71 by 27 pixels then Draws a blue line from (31, 92) to (251, 46) then Renders a red disk with center (304, 127) and radius 75.
; PLAN: r0=66(x), r1=73(y), r2=71(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x1), r6=92(y1), r7=251(x2), r8=46(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=127(y), r12=75(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 73
LDI r2, 71
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 92
LDI r7, 251
LDI r8, 46
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 127
LDI r12, 75
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
