; DESCRIPTION: Composite: Places a green line segment connecting (495, 228) to (228, 215) then Places a red circle of radius 74 at center (75, 154) then Creates a green rectangular region at (448, 114) spanning 46 by 113 pixels.
; PLAN: r0=495(x1), r1=228(y1), r2=228(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=154(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=448(x), r11=114(y), r12=46(width), r13=113(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 228
LDI r2, 228
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 154
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 448
LDI r11, 114
LDI r12, 46
LDI r13, 113
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
