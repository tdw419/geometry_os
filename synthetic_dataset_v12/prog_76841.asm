; DESCRIPTION: Composite: Creates a purple rectangular region at (48, 100) spanning 26 by 11 pixels then Renders a white line between points (467, 230) and (173, 16).
; PLAN: r0=48(x), r1=100(y), r2=26(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x1), r6=230(y1), r7=173(x2), r8=16(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 100
LDI r2, 26
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 230
LDI r7, 173
LDI r8, 16
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
