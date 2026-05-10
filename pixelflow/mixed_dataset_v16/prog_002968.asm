; DESCRIPTION: Composite: Draws a white line from (14, 21) to (274, 46) then Renders a white box of size 47x93 starting at (96, 163).
; PLAN: r0=14(x1), r1=21(y1), r2=274(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=163(y), r7=47(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 21
LDI r2, 274
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 163
LDI r7, 47
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
