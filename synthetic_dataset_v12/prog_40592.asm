; DESCRIPTION: Composite: Creates a yellow rectangular region at (341, 114) spanning 56 by 22 pixels then Draws a red line from (372, 48) to (298, 19).
; PLAN: r0=341(x), r1=114(y), r2=56(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x1), r6=48(y1), r7=298(x2), r8=19(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 114
LDI r2, 56
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 48
LDI r7, 298
LDI r8, 19
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
