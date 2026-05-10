; DESCRIPTION: Composite: Draws a green line from (239, 160) to (200, 53) then Creates a yellow rectangular region at (92, 109) spanning 44 by 101 pixels.
; PLAN: r0=239(x1), r1=160(y1), r2=200(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=109(y), r7=44(width), r8=101(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 160
LDI r2, 200
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 109
LDI r7, 44
LDI r8, 101
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
