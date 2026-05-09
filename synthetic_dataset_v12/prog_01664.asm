; DESCRIPTION: Composite: Places a red line segment connecting (188, 60) to (320, 67) then Creates a yellow rectangular region at (236, 124) spanning 21 by 88 pixels.
; PLAN: r0=188(x1), r1=60(y1), r2=320(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=124(y), r7=21(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 60
LDI r2, 320
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 124
LDI r7, 21
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
