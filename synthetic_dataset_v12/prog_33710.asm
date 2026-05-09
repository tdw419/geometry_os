; DESCRIPTION: Composite: Renders a purple box of size 73x20 starting at (86, 38) then Sets a single yellow pixel at (218, 52) then Places a magenta line segment connecting (465, 22) to (121, 25).
; PLAN: r0=86(x), r1=38(y), r2=73(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=52(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=465(x1), r11=22(y1), r12=121(x2), r13=25(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 38
LDI r2, 73
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 52
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 465
LDI r11, 22
LDI r12, 121
LDI r13, 25
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
