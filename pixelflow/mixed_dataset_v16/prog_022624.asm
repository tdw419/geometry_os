; DESCRIPTION: Composite: Draws a blue line from (469, 24) to (377, 71) then Creates a cyan circular shape at (369, 67) with radius 65.
; PLAN: r0=469(x1), r1=24(y1), r2=377(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=67(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 469
LDI r1, 24
LDI r2, 377
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 67
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
