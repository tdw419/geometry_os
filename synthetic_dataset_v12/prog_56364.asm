; DESCRIPTION: Composite: Renders a orange line between points (262, 74) and (11, 7) then Creates a yellow rectangular region at (179, 55) spanning 69 by 44 pixels.
; PLAN: r0=262(x1), r1=74(y1), r2=11(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=55(y), r7=69(width), r8=44(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 74
LDI r2, 11
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 55
LDI r7, 69
LDI r8, 44
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
