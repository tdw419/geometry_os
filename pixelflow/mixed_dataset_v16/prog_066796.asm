; DESCRIPTION: Composite: Draws a blue line from (508, 210) to (173, 161) then Places a white circle of radius 80 at center (431, 86) then Renders a yellow box of size 65x79 starting at (401, 78).
; PLAN: r0=508(x1), r1=210(y1), r2=173(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=86(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x), r11=78(y), r12=65(width), r13=79(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 210
LDI r2, 173
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 86
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 78
LDI r12, 65
LDI r13, 79
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
