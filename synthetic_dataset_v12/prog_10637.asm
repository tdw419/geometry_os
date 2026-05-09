; DESCRIPTION: Composite: Renders a orange line between points (182, 206) and (152, 2) then Places a purple circle of radius 25 at center (472, 202).
; PLAN: r0=182(x1), r1=206(y1), r2=152(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=202(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 206
LDI r2, 152
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 202
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
