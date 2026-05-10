; DESCRIPTION: Composite: Creates a green rectangular region at (306, 36) spanning 78 by 92 pixels then Renders a red line between points (242, 124) and (418, 247) then Creates a red circular shape at (44, 116) with radius 29.
; PLAN: r0=306(x), r1=36(y), r2=78(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x1), r6=124(y1), r7=418(x2), r8=247(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=44(x), r11=116(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 36
LDI r2, 78
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 124
LDI r7, 418
LDI r8, 247
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 116
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
