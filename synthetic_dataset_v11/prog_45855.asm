; DESCRIPTION: Composite: . Then Draws a green rectangle at (14, 106) with width 38 and height 66. Then Draws a red line from (23, 47) to (11, 102).
; PLAN: r0=14(x), r1=106(y), r2=38(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=23(x1), r1=47(y1), r2=11(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (14, 106) with width 38 and height 66.
; PLAN: r0=14(x), r1=106(y), r2=38(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 106
LDI r2, 38
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red line from (23, 47) to (11, 102).
; PLAN: r0=23(x1), r1=47(y1), r2=11(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 47
LDI r2, 11
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
