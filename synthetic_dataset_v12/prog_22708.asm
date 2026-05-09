; DESCRIPTION: Composite: Places a yellow dot at position (507, 79) then Draws a magenta line from (371, 84) to (428, 19) then Creates a yellow rectangular region at (403, 10) spanning 99 by 116 pixels.
; PLAN: r0=507(x), r1=79(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=371(x1), r6=84(y1), r7=428(x2), r8=19(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=403(x), r11=10(y), r12=99(width), r13=116(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 79
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 371
LDI r6, 84
LDI r7, 428
LDI r8, 19
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 10
LDI r12, 99
LDI r13, 116
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
