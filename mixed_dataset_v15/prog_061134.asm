; DESCRIPTION: Composite: Renders a purple box of size 22x24 starting at (57, 200) then Sets a single yellow pixel at (161, 122) then Places a blue line segment connecting (198, 183) to (92, 38).
; PLAN: r0=57(x), r1=200(y), r2=22(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=122(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=198(x1), r11=183(y1), r12=92(x2), r13=38(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 200
LDI r2, 22
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 122
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 198
LDI r11, 183
LDI r12, 92
LDI r13, 38
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
