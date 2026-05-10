; DESCRIPTION: Composite: Renders a magenta line between points (149, 221) and (138, 228) then Creates a green rectangular region at (64, 33) spanning 65 by 31 pixels then Places a purple circle of radius 27 at center (45, 217).
; PLAN: r0=149(x1), r1=221(y1), r2=138(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=33(y), r7=65(width), r8=31(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x), r11=217(y), r12=27(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 221
LDI r2, 138
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 33
LDI r7, 65
LDI r8, 31
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 217
LDI r12, 27
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
