; DESCRIPTION: Composite: Creates a yellow rectangular region at (243, 103) spanning 13 by 105 pixels then Places a green line segment connecting (1, 101) to (204, 0).
; PLAN: r0=243(x), r1=103(y), r2=13(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=101(y1), r7=204(x2), r8=0(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 103
LDI r2, 13
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 101
LDI r7, 204
LDI r8, 0
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
