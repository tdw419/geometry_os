; DESCRIPTION: Composite: Places a magenta line segment connecting (455, 100) to (500, 241) then Places a white 116x47 rectangle at position (299, 205) then Renders a blue disk with center (179, 116) and radius 52.
; PLAN: r0=455(x1), r1=100(y1), r2=500(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=205(y), r7=116(width), r8=47(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=116(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 100
LDI r2, 500
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 205
LDI r7, 116
LDI r8, 47
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 116
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
