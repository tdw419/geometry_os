; DESCRIPTION: Composite: Draws a magenta line from (307, 254) to (402, 219) then Renders a purple disk with center (389, 111) and radius 30 then Creates a white rectangular region at (337, 216) spanning 54 by 18 pixels.
; PLAN: r0=307(x1), r1=254(y1), r2=402(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=111(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x), r11=216(y), r12=54(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 254
LDI r2, 402
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 111
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 216
LDI r12, 54
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
