; DESCRIPTION: Composite: Places a magenta line segment connecting (488, 87) to (368, 37) then Draws a purple circle centered at (423, 130) with radius 23.
; PLAN: r0=488(x1), r1=87(y1), r2=368(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=130(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 488
LDI r1, 87
LDI r2, 368
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 130
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
