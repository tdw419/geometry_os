; DESCRIPTION: Composite: Creates a orange rectangular region at (437, 116) spanning 70 by 65 pixels then Creates a red circular shape at (156, 219) with radius 28 then Draws a cyan line from (71, 69) to (302, 53).
; PLAN: r0=437(x), r1=116(y), r2=70(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=219(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x1), r11=69(y1), r12=302(x2), r13=53(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 116
LDI r2, 70
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 219
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 69
LDI r12, 302
LDI r13, 53
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
