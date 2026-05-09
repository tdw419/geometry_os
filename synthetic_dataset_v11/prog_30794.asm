; DESCRIPTION: Composite: . Then Renders a purple box of size 54x83 starting at (25, 106). Then Draws a purple line from (204, 75) to (77, 251).
; PLAN: r0=25(x), r1=106(y), r2=54(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=204(x1), r1=75(y1), r2=77(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple box of size 54x83 starting at (25, 106).
; PLAN: r0=25(x), r1=106(y), r2=54(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 106
LDI r2, 54
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (204, 75) to (77, 251).
; PLAN: r0=204(x1), r1=75(y1), r2=77(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 75
LDI r2, 77
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
