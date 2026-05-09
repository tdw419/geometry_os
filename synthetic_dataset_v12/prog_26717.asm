; DESCRIPTION: Composite: Creates a black rectangular region at (317, 85) spanning 51 by 92 pixels then Renders a cyan line between points (233, 255) and (105, 170).
; PLAN: r0=317(x), r1=85(y), r2=51(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=255(y1), r7=105(x2), r8=170(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 85
LDI r2, 51
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 255
LDI r7, 105
LDI r8, 170
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
