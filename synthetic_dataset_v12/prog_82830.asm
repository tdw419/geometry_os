; DESCRIPTION: Composite: Renders a white box of size 16x114 starting at (61, 130) then Draws a orange line from (50, 187) to (132, 121).
; PLAN: r0=61(x), r1=130(y), r2=16(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x1), r6=187(y1), r7=132(x2), r8=121(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 130
LDI r2, 16
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 187
LDI r7, 132
LDI r8, 121
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
