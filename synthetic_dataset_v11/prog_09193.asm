; DESCRIPTION: Composite: . Then Creates a white circular shape at (104, 101) with radius 71. Then Draws a magenta line from (126, 90) to (88, 97).
; PLAN: r0=104(x), r1=101(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x1), r1=90(y1), r2=88(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (104, 101) with radius 71.
; PLAN: r0=104(x), r1=101(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 101
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (126, 90) to (88, 97).
; PLAN: r0=126(x1), r1=90(y1), r2=88(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 90
LDI r2, 88
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
