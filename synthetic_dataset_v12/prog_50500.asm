; DESCRIPTION: Composite: Places a blue circle of radius 18 at center (409, 153) then Creates a purple rectangular region at (412, 21) spanning 27 by 88 pixels then Renders a cyan line between points (193, 135) and (437, 223).
; PLAN: r0=409(x), r1=153(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=21(y), r7=27(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x1), r11=135(y1), r12=437(x2), r13=223(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 153
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 21
LDI r7, 27
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 135
LDI r12, 437
LDI r13, 223
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
