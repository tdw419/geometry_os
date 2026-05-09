; DESCRIPTION: Composite: Draws a white circle centered at (131, 197) with radius 58 then Renders a magenta box of size 88x42 starting at (307, 177) then Renders a orange line between points (120, 180) and (495, 14).
; PLAN: r0=131(x), r1=197(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=177(y), r7=88(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x1), r11=180(y1), r12=495(x2), r13=14(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 197
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 177
LDI r7, 88
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 180
LDI r12, 495
LDI r13, 14
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
