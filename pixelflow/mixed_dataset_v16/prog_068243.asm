; DESCRIPTION: Composite: Places a purple line segment connecting (391, 146) to (297, 172) then Renders a white disk with center (356, 96) and radius 45 then Places a purple 72x59 rectangle at position (156, 27).
; PLAN: r0=391(x1), r1=146(y1), r2=297(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=96(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=156(x), r11=27(y), r12=72(width), r13=59(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 146
LDI r2, 297
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 96
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 156
LDI r11, 27
LDI r12, 72
LDI r13, 59
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
