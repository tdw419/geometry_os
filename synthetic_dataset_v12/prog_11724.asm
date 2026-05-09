; DESCRIPTION: Composite: Places a white 91x72 rectangle at position (301, 57) then Places a cyan line segment connecting (289, 0) to (169, 67) then Renders a magenta disk with center (369, 56) and radius 55.
; PLAN: r0=301(x), r1=57(y), r2=91(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x1), r6=0(y1), r7=169(x2), r8=67(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=56(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 57
LDI r2, 91
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 0
LDI r7, 169
LDI r8, 67
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 56
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
