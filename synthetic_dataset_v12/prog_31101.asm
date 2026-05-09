; DESCRIPTION: Composite: Renders a blue box of size 47x53 starting at (261, 118) then Renders a white line between points (42, 250) and (430, 154).
; PLAN: r0=261(x), r1=118(y), r2=47(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x1), r6=250(y1), r7=430(x2), r8=154(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 118
LDI r2, 47
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 250
LDI r7, 430
LDI r8, 154
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
