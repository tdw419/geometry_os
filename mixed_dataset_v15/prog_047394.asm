; DESCRIPTION: Composite: Draws a purple rectangle at (260, 87) with width 96 and height 53 then Renders a magenta line between points (297, 91) and (425, 194).
; PLAN: r0=260(x), r1=87(y), r2=96(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x1), r6=91(y1), r7=425(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 87
LDI r2, 96
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 91
LDI r7, 425
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
