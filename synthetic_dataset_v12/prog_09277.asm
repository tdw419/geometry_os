; DESCRIPTION: Composite: Creates a yellow rectangular region at (125, 3) spanning 24 by 107 pixels then Renders a orange line between points (367, 103) and (370, 136).
; PLAN: r0=125(x), r1=3(y), r2=24(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x1), r6=103(y1), r7=370(x2), r8=136(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 3
LDI r2, 24
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 103
LDI r7, 370
LDI r8, 136
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
