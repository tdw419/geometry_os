; DESCRIPTION: Composite: Renders a yellow disk with center (313, 67) and radius 28 then Draws a red line from (251, 81) to (228, 56) then Creates a green rectangular region at (416, 191) spanning 81 by 13 pixels.
; PLAN: r0=313(x), r1=67(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x1), r6=81(y1), r7=228(x2), r8=56(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=416(x), r11=191(y), r12=81(width), r13=13(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 67
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 81
LDI r7, 228
LDI r8, 56
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 191
LDI r12, 81
LDI r13, 13
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
