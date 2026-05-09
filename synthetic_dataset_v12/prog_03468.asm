; DESCRIPTION: Composite: Renders a yellow box of size 23x47 starting at (308, 29) then Renders a magenta disk with center (400, 52) and radius 33 then Places a magenta line segment connecting (411, 210) to (113, 153).
; PLAN: r0=308(x), r1=29(y), r2=23(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=52(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x1), r11=210(y1), r12=113(x2), r13=153(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 29
LDI r2, 23
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 52
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 210
LDI r12, 113
LDI r13, 153
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
