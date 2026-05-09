; DESCRIPTION: Composite: . Then Draws a red circle centered at (110, 113) with radius 14. Then Renders a magenta line between points (162, 246) and (116, 99).
; PLAN: r0=110(x), r1=113(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=162(x1), r1=246(y1), r2=116(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (110, 113) with radius 14.
; PLAN: r0=110(x), r1=113(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 113
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (162, 246) and (116, 99).
; PLAN: r0=162(x1), r1=246(y1), r2=116(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 246
LDI r2, 116
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
