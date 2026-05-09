; DESCRIPTION: Composite: . Then Renders a orange line between points (79, 106) and (101, 216). Then Creates a white rectangular region at (88, 151) spanning 102 by 98 pixels.
; PLAN: r0=79(x1), r1=106(y1), r2=101(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=88(x), r1=151(y), r2=102(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (79, 106) and (101, 216).
; PLAN: r0=79(x1), r1=106(y1), r2=101(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 106
LDI r2, 101
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (88, 151) spanning 102 by 98 pixels.
; PLAN: r0=88(x), r1=151(y), r2=102(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 151
LDI r2, 102
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
