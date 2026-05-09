; DESCRIPTION: Composite: . Then Draws a black line from (53, 6) to (226, 162). Then Creates a yellow rectangular region at (106, 91) spanning 40 by 118 pixels.
; PLAN: r0=53(x1), r1=6(y1), r2=226(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=106(x), r1=91(y), r2=40(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (53, 6) to (226, 162).
; PLAN: r0=53(x1), r1=6(y1), r2=226(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 6
LDI r2, 226
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (106, 91) spanning 40 by 118 pixels.
; PLAN: r0=106(x), r1=91(y), r2=40(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 91
LDI r2, 40
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
