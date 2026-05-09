; DESCRIPTION: Composite: Creates a cyan circular shape at (369, 184) with radius 66 then Renders a magenta line between points (461, 244) and (33, 60) then Creates a purple rectangular region at (98, 85) spanning 18 by 82 pixels.
; PLAN: r0=369(x), r1=184(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x1), r6=244(y1), r7=33(x2), r8=60(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=85(y), r12=18(width), r13=82(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 184
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 244
LDI r7, 33
LDI r8, 60
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 85
LDI r12, 18
LDI r13, 82
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
