; DESCRIPTION: Composite: Creates a cyan rectangular region at (28, 100) spanning 57 by 56 pixels then Creates a cyan circular shape at (84, 82) with radius 76 then Draws a blue line from (204, 159) to (13, 193).
; PLAN: r0=28(x), r1=100(y), r2=57(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=82(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x1), r11=159(y1), r12=13(x2), r13=193(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 100
LDI r2, 57
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 82
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 159
LDI r12, 13
LDI r13, 193
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
