; DESCRIPTION: Composite: Renders a red box of size 77x51 starting at (303, 148) then Renders a orange line between points (39, 16) and (156, 169).
; PLAN: r0=303(x), r1=148(y), r2=77(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x1), r6=16(y1), r7=156(x2), r8=169(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 148
LDI r2, 77
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 16
LDI r7, 156
LDI r8, 169
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
