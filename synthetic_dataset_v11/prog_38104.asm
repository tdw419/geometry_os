; DESCRIPTION: Composite: . Then Renders a green box of size 94x118 starting at (109, 85). Then Draws a purple line from (207, 115) to (73, 68).
; PLAN: r0=109(x), r1=85(y), r2=94(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=207(x1), r1=115(y1), r2=73(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 94x118 starting at (109, 85).
; PLAN: r0=109(x), r1=85(y), r2=94(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 85
LDI r2, 94
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (207, 115) to (73, 68).
; PLAN: r0=207(x1), r1=115(y1), r2=73(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 115
LDI r2, 73
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
