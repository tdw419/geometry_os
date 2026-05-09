; DESCRIPTION: Composite: Creates a blue rectangular region at (107, 83) spanning 74 by 66 pixels then Renders a blue line between points (130, 111) and (393, 158).
; PLAN: r0=107(x), r1=83(y), r2=74(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=111(y1), r7=393(x2), r8=158(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 83
LDI r2, 74
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 111
LDI r7, 393
LDI r8, 158
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
