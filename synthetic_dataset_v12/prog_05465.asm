; DESCRIPTION: Composite: Creates a red rectangular region at (218, 201) spanning 18 by 30 pixels then Places a cyan circle of radius 62 at center (252, 148) then Renders a yellow line between points (181, 23) and (213, 157).
; PLAN: r0=218(x), r1=201(y), r2=18(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=148(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x1), r11=23(y1), r12=213(x2), r13=157(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 201
LDI r2, 18
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 148
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 23
LDI r12, 213
LDI r13, 157
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
