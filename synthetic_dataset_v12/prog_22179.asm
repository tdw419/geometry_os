; DESCRIPTION: Composite: Creates a purple rectangular region at (73, 146) spanning 40 by 72 pixels then Renders a white disk with center (478, 166) and radius 15 then Draws a purple line from (180, 108) to (502, 249).
; PLAN: r0=73(x), r1=146(y), r2=40(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=166(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x1), r11=108(y1), r12=502(x2), r13=249(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 146
LDI r2, 40
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 166
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 108
LDI r12, 502
LDI r13, 249
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
