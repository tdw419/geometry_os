; DESCRIPTION: Composite: . Then Renders a purple line between points (20, 91) and (167, 124). Then Creates a magenta rectangular region at (41, 61) spanning 118 by 54 pixels.
; PLAN: r0=20(x1), r1=91(y1), r2=167(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=61(y), r2=118(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (20, 91) and (167, 124).
; PLAN: r0=20(x1), r1=91(y1), r2=167(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 91
LDI r2, 167
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta rectangular region at (41, 61) spanning 118 by 54 pixels.
; PLAN: r0=41(x), r1=61(y), r2=118(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 61
LDI r2, 118
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
