; DESCRIPTION: Composite: Creates a blue rectangular region at (193, 50) spanning 67 by 48 pixels then Renders a black disk with center (343, 193) and radius 16 then Renders a magenta line between points (36, 180) and (456, 75).
; PLAN: r0=193(x), r1=50(y), r2=67(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=193(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x1), r11=180(y1), r12=456(x2), r13=75(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 50
LDI r2, 67
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 193
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 180
LDI r12, 456
LDI r13, 75
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
