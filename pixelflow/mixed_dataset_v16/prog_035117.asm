; DESCRIPTION: Composite: Places a blue circle of radius 77 at center (230, 82) then Renders a yellow line between points (183, 25) and (290, 253) then Creates a orange rectangular region at (372, 72) spanning 85 by 85 pixels.
; PLAN: r0=230(x), r1=82(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x1), r6=25(y1), r7=290(x2), r8=253(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=72(y), r12=85(width), r13=85(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 82
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 25
LDI r7, 290
LDI r8, 253
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 72
LDI r12, 85
LDI r13, 85
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
