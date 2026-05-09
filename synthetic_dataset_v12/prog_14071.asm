; DESCRIPTION: Composite: Draws a yellow circle centered at (308, 111) with radius 79 then Renders a magenta line between points (19, 190) and (447, 125) then Creates a green rectangular region at (228, 103) spanning 86 by 116 pixels.
; PLAN: r0=308(x), r1=111(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x1), r6=190(y1), r7=447(x2), r8=125(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=103(y), r12=86(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 111
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 190
LDI r7, 447
LDI r8, 125
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 103
LDI r12, 86
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
