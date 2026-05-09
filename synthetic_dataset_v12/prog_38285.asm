; DESCRIPTION: Composite: Places a green line segment connecting (156, 250) to (214, 204) then Creates a purple rectangular region at (177, 79) spanning 81 by 55 pixels then Renders a orange disk with center (461, 86) and radius 42.
; PLAN: r0=156(x1), r1=250(y1), r2=214(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=79(y), r7=81(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=461(x), r11=86(y), r12=42(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 250
LDI r2, 214
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 79
LDI r7, 81
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 86
LDI r12, 42
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
