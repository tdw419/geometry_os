; DESCRIPTION: Composite: Renders a purple box of size 19x37 starting at (279, 61) then Places a blue line segment connecting (36, 157) to (124, 181).
; PLAN: r0=279(x), r1=61(y), r2=19(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x1), r6=157(y1), r7=124(x2), r8=181(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 61
LDI r2, 19
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 157
LDI r7, 124
LDI r8, 181
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
