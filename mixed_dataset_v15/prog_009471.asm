; DESCRIPTION: Composite: Creates a red rectangular region at (243, 101) spanning 67 by 51 pixels then Draws a cyan line from (109, 58) to (125, 119) then Renders a cyan disk with center (251, 91) and radius 55.
; PLAN: r0=243(x), r1=101(y), r2=67(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=58(y1), r7=125(x2), r8=119(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=91(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 101
LDI r2, 67
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 58
LDI r7, 125
LDI r8, 119
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 91
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
