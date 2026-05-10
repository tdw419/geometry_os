; DESCRIPTION: Composite: Creates a yellow rectangular region at (151, 179) spanning 108 by 37 pixels then Renders a white line between points (345, 40) and (19, 237).
; PLAN: r0=151(x), r1=179(y), r2=108(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x1), r6=40(y1), r7=19(x2), r8=237(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 179
LDI r2, 108
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 40
LDI r7, 19
LDI r8, 237
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
