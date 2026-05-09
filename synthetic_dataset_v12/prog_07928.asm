; DESCRIPTION: Composite: Renders a blue line between points (294, 77) and (478, 109) then Renders a white box of size 17x96 starting at (452, 102).
; PLAN: r0=294(x1), r1=77(y1), r2=478(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=102(y), r7=17(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 77
LDI r2, 478
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 102
LDI r7, 17
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
