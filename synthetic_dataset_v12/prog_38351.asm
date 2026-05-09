; DESCRIPTION: Composite: Renders a yellow disk with center (53, 34) and radius 34 then Renders a purple box of size 47x112 starting at (319, 77) then Places a magenta line segment connecting (385, 22) to (64, 81).
; PLAN: r0=53(x), r1=34(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=77(y), r7=47(width), r8=112(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x1), r11=22(y1), r12=64(x2), r13=81(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 34
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 77
LDI r7, 47
LDI r8, 112
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 22
LDI r12, 64
LDI r13, 81
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
