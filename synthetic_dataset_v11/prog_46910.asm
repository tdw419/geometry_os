; DESCRIPTION: Composite: . Then Renders a red line between points (118, 231) and (30, 207). Then Draws a purple circle centered at (117, 134) with radius 63.
; PLAN: r0=118(x1), r1=231(y1), r2=30(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=117(x), r1=134(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (118, 231) and (30, 207).
; PLAN: r0=118(x1), r1=231(y1), r2=30(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 231
LDI r2, 30
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (117, 134) with radius 63.
; PLAN: r0=117(x), r1=134(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 134
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
