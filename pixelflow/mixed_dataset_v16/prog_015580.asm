; DESCRIPTION: Composite: Creates a purple rectangular region at (50, 42) spanning 76 by 116 pixels then Renders a yellow line between points (490, 16) and (237, 247) then Places a red circle of radius 54 at center (423, 196).
; PLAN: r0=50(x), r1=42(y), r2=76(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x1), r6=16(y1), r7=237(x2), r8=247(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=423(x), r11=196(y), r12=54(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 42
LDI r2, 76
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 16
LDI r7, 237
LDI r8, 247
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 196
LDI r12, 54
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
