; DESCRIPTION: Composite: Renders a blue line between points (337, 68) and (225, 233) then Draws a red circle centered at (218, 109) with radius 65 then Draws a magenta rectangle at (228, 152) with width 15 and height 69.
; PLAN: r0=337(x1), r1=68(y1), r2=225(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=109(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x), r11=152(y), r12=15(width), r13=69(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 68
LDI r2, 225
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 109
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 152
LDI r12, 15
LDI r13, 69
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
