; DESCRIPTION: Composite: Creates a green rectangular region at (158, 197) spanning 105 by 23 pixels then Draws a magenta line from (41, 196) to (90, 50).
; PLAN: r0=158(x), r1=197(y), r2=105(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x1), r6=196(y1), r7=90(x2), r8=50(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 197
LDI r2, 105
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 196
LDI r7, 90
LDI r8, 50
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
