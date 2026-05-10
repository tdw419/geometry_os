; DESCRIPTION: Composite: Draws a green line from (268, 127) to (0, 185) then Draws a red circle centered at (288, 191) with radius 12.
; PLAN: r0=268(x1), r1=127(y1), r2=0(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=191(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 127
LDI r2, 0
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 191
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
