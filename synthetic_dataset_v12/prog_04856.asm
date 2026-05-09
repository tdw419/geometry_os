; DESCRIPTION: Composite: Draws a white line from (167, 140) to (95, 166) then Renders a green disk with center (103, 208) and radius 29 then Creates a purple rectangular region at (217, 116) spanning 108 by 110 pixels.
; PLAN: r0=167(x1), r1=140(y1), r2=95(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=208(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=116(y), r12=108(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 140
LDI r2, 95
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 208
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 116
LDI r12, 108
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
