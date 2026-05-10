; DESCRIPTION: Composite: Places a blue line segment connecting (216, 109) to (64, 253) then Renders a red disk with center (264, 77) and radius 71 then Places a magenta 12x33 rectangle at position (241, 118).
; PLAN: r0=216(x1), r1=109(y1), r2=64(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=77(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=118(y), r12=12(width), r13=33(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 109
LDI r2, 64
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 77
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 118
LDI r12, 12
LDI r13, 33
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
