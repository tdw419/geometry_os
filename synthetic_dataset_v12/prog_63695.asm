; DESCRIPTION: Composite: Renders a yellow line between points (382, 23) and (221, 88) then Creates a cyan circular shape at (79, 95) with radius 52 then Creates a red rectangular region at (261, 133) spanning 120 by 102 pixels.
; PLAN: r0=382(x1), r1=23(y1), r2=221(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=95(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x), r11=133(y), r12=120(width), r13=102(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 23
LDI r2, 221
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 95
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 133
LDI r12, 120
LDI r13, 102
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
